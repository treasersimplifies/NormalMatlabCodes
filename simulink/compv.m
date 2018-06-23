function [x]=compv(u)  % x为函数的输出，u为M函数的输入
%u(1)=omega2 
%u(2)=theta2 
%u(3)=theta3
r2=15;                 % 连杆2、3的长度
r3=55;
% 求解运动学方程
a=[r3*sin(u(3)) 1;-r3*cos(u(3)) 0];    
b=[-r2*u(1)*sin(u(2));r2*u(1)*cos(u(2))]; 
x=inv(a)*b; 
end
