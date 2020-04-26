function [x, y] = generate_data_spirals(N, d, plot_flag)

r = linspace(0.2, 1, N);
phi = linspace(0, 5*pi/4, N);

inx = randperm(N, N/2);     % N/2 samples chosen

y = 1:N;
y(inx) = -1;
y(y>0) = 1;

x(:, 1) = r.*cos(phi + pi/2.*y);        % x
x(:, 2) = r.*sin(phi + pi/2.*y);        % y

x = x + randn(size(x))/20;   % add noise

if plot_flag
    figure('WindowStyle','docked');
    colormap(jet);
    scatter(x(:, 1), x(:, 2), [], y, 'o');
end

x(:, 3:d) = rand(N, d-2);   % add dimantions


end