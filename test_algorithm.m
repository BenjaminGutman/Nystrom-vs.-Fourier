% set flag to 0
tic
A = [];
for m=[5 10 20 50 100]
    for i=1:10
        click_me
        A = [A ; accuracy];
    end
    toc
end


figure('WindowStyle','docked');
B = reshape(A, 10, 10);
errorbar(mean(B(:, 1:5)), std(B(:, 1:5)))
legend('Nystrom', 'Fourier')
