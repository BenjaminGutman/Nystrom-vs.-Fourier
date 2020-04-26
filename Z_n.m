function vec = Z_n(D, V, x, x_i, sigma)

m = size(x_i, 1);
vec = zeros(m, 1);
for i = 1:m
    vec(i) = RBF(x, x_i(i, :), sigma);
end
vec = diag(D.^(-0.5)) * V.' * vec; 

end
