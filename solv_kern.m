function w_sol = solv_kern(z_n, x, y, m, lambda)

N = size(x, 1);
Zz = zeros(m, N);
for i=1:N
    Zz(:, i) = z_n(x(i, :));
end

temp_y = 2*Zz*(y.');
temp_x = 2*Zz*(Zz.') + lambda*eye(m);

w_sol = temp_y.'/temp_x;
end