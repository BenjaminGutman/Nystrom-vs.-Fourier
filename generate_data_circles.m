function [x, y] = generate_data_circles(N, d, plot_flag)

factor = 1.1;
x = rand(round(4*N/pi*factor), 2)-1/2;
x(x(:, 1).^2 + x(:, 2).^2 >0.25, :) = []; %restrict circle

x = x(1:N ,:); % remaining N samples;

x(:, 1) = x(:, 1) + 0.5;

inx = randperm(N, N/2);     % N/2 samples chosen
x(inx, 1) = x(inx, 1) - 1;  

y = 1:N;
y(inx) = -1;
y(y>0) = 1;

if plot_flag
    figure('WindowStyle','docked');
    colormap(jet);
    scatter(x(:, 1), x(:, 2), [], y, '.');
end
x(:, 3:d) = rand(N, d-2);   % add dimantions

end