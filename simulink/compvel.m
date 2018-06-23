compvel.m
function [x]=compvel(u)
r2=1.0;
r3=4.0;
a=[r3*sin(u(3)) 1 ; -r3*cos(u(3)) 0];
b=[-r2*u(1)*sin(u(2)); r2*u(1)*cos(u(2))];
x=inv(a)*b;