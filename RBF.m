function k = RBF(x, y, sigma)

% sigma = 6;
k = exp(-norm(x-y).^2/(2*sigma^2));

end