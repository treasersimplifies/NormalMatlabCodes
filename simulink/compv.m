function [x]=compv(u)  % xΪ�����������uΪM����������
%u(1)=omega2 
%u(2)=theta2 
%u(3)=theta3
r2=15;                 % ����2��3�ĳ���
r3=55;
% ����˶�ѧ����
a=[r3*sin(u(3)) 1;-r3*cos(u(3)) 0];    
b=[-r2*u(1)*sin(u(2));r2*u(1)*cos(u(2))]; 
x=inv(a)*b; 
end
