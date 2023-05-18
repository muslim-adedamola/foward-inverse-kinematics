function Z = FK(A,B,C,D,E,F)

syms Qx Qy Qz;
assume(Qx, 'real');
assume(Qy, 'real');
assume(Qz, 'real');

EE = [1 0 0 0; 0 1 0 0; 0 0 1 0; Qx Qy Qz 1];

Z = A*B*C*D*E*F;

end