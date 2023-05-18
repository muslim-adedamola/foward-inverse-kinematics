%To use this function, K is a vector that passes through
%the origin. Example used to test code is 
% [0.7071 0.7071 0]. Angle theta used is 30 degrees
% Another example is [0.7071 0 0.7071]. Angle used is 
% 60 degrees

function visualize1(K, theta1)

%convert generic axis angle to radian
theta = (theta1 * pi) / 180;
V_t = 1 - cos(theta);

%calculates corresponding matrix of generic axis angle
% using the angle theta and generic axis vector
Rk = [ K(1)*K(1)*V_t + cos(theta), ...  
    K(1)*K(2)*V_t - K(3)*sin(theta), ...
    K(1)*K(3)*V_t + K(2)*sin(theta); ...
        
        K(1)*K(2)*V_t + K(3)*sin(theta), ... 
        K(2)*K(2)*V_t + cos(theta), ...
        K(2)*K(3)*V_t - K(1)*sin(theta); ...

        K(1)*K(3)*V_t - K(2)*sin(theta), ...
        K(2)*K(3)*V_t + K(1)*sin(theta), ...
        K(3)*K(3)*V_t + cos(theta)];

Xold = [1 0 0]; %unit vector of fixed frame along X
Yold = [0 1 0]; %unit vector of fixed frame along Y
Zold = [0 0 1]; %unit vector of fixed frame along Z


Xnew = Rk(1:3, 1); %unit vector of new frame obtained from Rk, generic axis for x
Ynew = Rk(1:3, 2); %unit vector of new frame obtained from Rk,generic axis for y
Znew = Rk(1:3, 3); %unit vector of new frame obtained from Rk,generic axis for z

%visualization section
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

quiver3(0,0,0,K(1), K(2), K(3), 'y')
text(K(1), K(2), K(3),'generic-axis K')

Rk
% code to text that matrix obtained is orthonormal.
% the normal of each columns is calculated and formed
%into matrix  N
N1 = norm(Rk(1:3, 1));
N2 = norm(Rk(1:3, 2));
N3 = norm(Rk(1:3, 3));

N = [N1 N2 N3]'

%dot product of each column of matrix is calculated
%and formed into matrix.
D1 = dot(Rk(1:3, 1), Rk(1:3, 2));
D2 = dot(Rk(1:3, 1), Rk(1:3, 3));
D3 = dot(Rk(1:3, 2), Rk(1:3, 3));

D = [D1 D2 D3]'


