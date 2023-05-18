function visualize2(gamma1, beta1, alpha1)

%convert gamma, beta, alpha to radians
gamma = (gamma1 * pi) / 180;
beta = (beta1 * pi) / 180;
alpha = (alpha1 * pi) / 180;

%code for the equivalent rotation matrix of XYZ
%Euler's angle
RotXYZ = [cos(alpha)*cos(beta)...
            cos(alpha)*sin(beta)*sin(gamma) - sin(alpha)*cos(gamma)...
            (cos(alpha)*sin(beta)*cos(gamma) + sin(alpha)*sin(gamma));...
            
            sin(alpha)*cos(beta)...
            (sin(alpha)*sin(beta)*sin(gamma) + cos(alpha)*cos(gamma))...
            (sin(alpha)*sin(beta)*cos(gamma) - cos(alpha)*sin(gamma));...

            -sin(beta)...
            cos(beta)*sin(gamma)...
            cos(beta)*cos(gamma)]

%visualization section
Xold = [1 0 0]; %unit vector of fixed frame along X
Yold = [0 1 0]; %unit vector of fixed frame along Y
Zold = [0 0 1]; %unit vector of fixed frame along 

Xnew = RotXYZ(1:3, 1); %unit vector of new frame obtained from RotXYZ for x
Ynew = RotXYZ(1:3, 2); %unit vector of new frame obtained from RotXYZ for y
Znew = RotXYZ(1:3, 3); %unit vector of new frame obtained from RotXYZ for z

% Xff means fixed frame, colored red
% Xmf means moving frame colored blue
quiver3(0,0,0,1,0,0,'r')
hold on
quiver3(0,0,0,0,1,0,'r')
quiver3(0,0,0,0,0,1,'r')
text(Xold(1),Xold(2),Xold(3),'Xff')
text(Yold(1),Yold(2),Yold(3),'Yff')
text(Zold(1),Zold(2),Zold(3),'Zff')

quiver3(0,0,0,Xnew(1),Xnew(2),Xnew(3),'b')
quiver3(0,0,0,Ynew(1),Ynew(2),Ynew(3),'b')
quiver3(0,0,0,Znew(1),Znew(2),Znew(3),'b')
text(Xnew(1),Xnew(2),Xnew(3),'Xmf')
text(Ynew(1),Ynew(2),Ynew(3),'Ymf')
text(Znew(1),Znew(2),Znew(3),'Zmf')


%Proof that normal of each columns is 1
N1 = norm(RotXYZ(1:3, 1));
N2 = norm(RotXYZ(1:3, 2));
N3 = norm(RotXYZ(1:3, 3));

N = [N1 N2 N3]

%Proof to show dot product of correspondig columns is zero.
D1 = dot(RotXYZ(1:3, 1), RotXYZ(1:3, 2));
D2 = dot(RotXYZ(1:3, 1), RotXYZ(1:3, 3));
D3 = dot(RotXYZ(1:3, 2), RotXYZ(1:3, 3));

D = [D1 D2 D3]