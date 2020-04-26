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