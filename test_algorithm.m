% set flag to 0
tic
A = [];
for m=[5 10 20 50 100 200 500]
    for i=1:10
        klick_me
        A = [A ; accuracy];
    end
    toc
end