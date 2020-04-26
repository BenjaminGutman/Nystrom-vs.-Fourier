function K = generateK(x, sigma, inx)

N = size(x, 1);

if nargin>2
    
    m = length(inx);
    K = zeros(N, m);
    for i = 1:m
        for j = 1:N
            K(j, i) = RBF(x(j, :), x(inx(i), :), sigma);
        end
    end
    
else
    
    K = zeros(N);
    
    for i = 1:N
        for j = 1:N
            K(i, j) = RBF(x(j, :), x(i, :), sigma);
        end
        
    end
    
end