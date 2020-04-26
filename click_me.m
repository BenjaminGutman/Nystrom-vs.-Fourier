%% params

N = 1000;           % size of training set
d = 100;            % dimension 
m = 5;              % size of subset
test_set_size = 100;
sigma = 6;          % params for Normal dist.

% data_type = '2 circles';
data_type = 'spirals';

flag.plot_trainingset = 0;
flag.plot_testingset = 0;

%% generate data
switch data_type
    case '2 circles'
        [training_set, y] = generate_data_circles(N, d, flag.plot_trainingset);
        [testing_set, test_y] = generate_data_circles(test_set_size, d, 0);
        lambda = 1e-2;
    case 'spirals'
        [training_set, y] = generate_data_spirals(N, d, flag.plot_trainingset);
        [testing_set, test_y] = generate_data_spirals(test_set_size, d, 0);   
        lambda = 5e-1;
end

%% subset of training set
inx = randperm(N, m);
subset = training_set(inx, :);
subset_y = y(inx);


%% Nystrom
K_b = generateK(training_set, sigma, inx);
K_hat = generateK(subset, sigma);
% K_hat_dag = pinv(K_hat);
% K_r = K_b*K_hat_dag*(K_b.');
[V,D] = eig(K_hat);
D = diag(D);
z_n = @(x) Z_n(D, V, x, subset, sigma);
w = solv_kern(z_n, training_set, y, m, lambda);

%% test Nystrom
f = @(x) w*z_n(x);
predN = zeros(1, test_set_size);
for i = 1:test_set_size
    predN(i) = f(testing_set(i, :));
end
predN(predN>0) = 1;
predN(predN<0) = -1;
accuracy(1) = 1 - sum(abs(predN - test_y))/(2*test_set_size);

%% Fourier 
u = randn(d, m)*sigma;
z_f = @(x) Z_f(x, u);
w = solv_kern(z_f, training_set, y, 2*m, lambda);

%% test Fourier
f = @(x) w*z_f(x);
predF = zeros(1, test_set_size);
for i = 1:test_set_size
    predF(i) = f(testing_set(i, :));
end
predF(predF>0) = 1;
predF(predF<0) = -1;
accuracy(2) = 1 - sum(abs(predF - test_y))/(2*test_set_size);

%% plot testing set
if flag.plot_testingset
    figure('WindowStyle','docked');
    hold on;
    colormap(jet);
    scatter(testing_set(:, 1), testing_set(:, 2), [], test_y, 'o');
    scatter(testing_set(:, 1), testing_set(:, 2), [], predN, 'x');
    scatter(testing_set(:, 1), testing_set(:, 2), [], predF, '+');
    legend('true', 'nystrom', 'Fourier')
end

