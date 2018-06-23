
%T(x,t) = Ts+(Ti-Ts)*erf(x/2*(at)^0.5)\
format long
syms Ts Ti a t x
T(x,t) = Ts+(Ti-Ts)*erf(x/(2*(a*t)^0.5))

t =  subs(T,{Ts Ti a t},{20 -15 0.138e-6,60*86400});
Ts=20;
Ti = -15 ;
a = 0.138e-6;
t = 60*86400;
f = @(x) -15+35*erf(x/(2*(60*86400*0.138e-6)^0.5))
fzerotx(f,[0,1])


%{
µ√µΩ¡À

ans =

   0.676961854481936
%}
