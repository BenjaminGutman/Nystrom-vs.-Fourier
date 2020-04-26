function z = Z_f(x, u)

z = [sin((u.')*(x.')) cos((u.')*(x.'))].';

z = reshape(z, 2*size(z, 2), 1);
end