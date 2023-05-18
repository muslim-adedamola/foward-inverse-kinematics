function M = screw_matrix(Sx, Sy, Sz, Sox, Soy)

syms theta t Soz;
assume(theta, 'real');
assume(t, 'real');
assume(Soz, 'real');

a11 = (Sx^2 - 1)*(1 - cos(theta)) + 1;
a12 = Sx*Sy*(1 - cos(theta)) - Sz*sin(theta);
a13 = Sx*Sz*(1 - cos(theta)) + Sy*sin(theta);
a21 = Sy*Sx*(1 - cos(theta)) + Sz*sin(theta);
a22 = (Sy^2 - 1)*(1 - cos(theta)) + 1;
a23 = Sy*Sz*(1 - cos(theta)) - Sx*sin(theta);
a31 = Sz*Sx*(1 - cos(theta)) - Sy*sin(theta);
a32 = Sz*Sy*(1 - cos(theta)) + Sx*sin(theta);
a33 = (Sz^2 - 1)*(1 - cos(theta)) + 1;

a14 = t*Sx - Sox*(a11 - 1) - Soy*a12 - Soz*a13;
a24 = t*Sy - Sox*a21 - Soy*(a22 - 1) - Soz*a23;
a34 = t*Sz - Sox*a31 - Soy*a32 - Soz*(a33 - 1);

M = [a11 a12 a13 a14; a21 a22 a23 a24; a31 a32 a33 a34; 0 0 0 1];

end