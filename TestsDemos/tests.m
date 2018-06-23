%{
syms vx fai1 th
A = sym('[92.05 7.02 534.1 0;7.02 4.028 0 76.44]');
b = [-16.12975*vx*fai1; th-2.1294*vx*fai1];
fai = A\b

syms s c m
A = [1 0; -1 -1];
B = [0 ;1];
C = [1 0];
D = [0];
I = [1 0; 0 1];
[num den] = ss2tf(A,B,C,D,1)
%}

num = [0 0 50];
den = [25 2 1];
sys = tf(num,den)
%step(num,den)
%grid
z = [1];
p = [-2 -3];
k=2;
sys2 = zpk(z,p,k)

num = [10];
den = [1 4.47 0];
tf(num,den)
step(num,den)
grid