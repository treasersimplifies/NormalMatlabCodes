
x = [-1.00 -0.96 -0.65 0.10 0.40 1.00];
y = [-1.0000 -0.1512 0.3860 0.4802 0.8838 1.0000];
ux = -1:0.01:1;
% a)
%pieceline
uy1 = piecelin(x,y,ux);
%polyinterp
uy2 = polyinterp(x,y,ux);
%splinetx
uy3 = splinetx(x,y,ux);
%pchiptx
uy4 = pchiptx(x,y,ux);
plot(ux,uy1,ux,uy2,ux,uy4);
%结果图中作了相应的标示

%b）
piecelin_y = piecelin(x,y,-0.3)
polyinterp_y = polyinterp(x,y,-0.3)
splinetx_y = splinetx(x,y,-0.3)
pchiptx_y = pchiptx(x,y,-0.3)
%{
得到了：
pieceline_y =   0.4300

polyinterp_y =  -0.9990

spline_y =  -0.1957

pchip_y =   0.4322
%}

%c)
%用拉格朗日法，或者观察图像，可以知道这个低次多项式必定是奇函数，而且由拉格朗日法得必为5次。
%因此可以设 y = kx^5+bx^3+mx；
%{
A = [1 1 1;
    0.1^5 0.1^3 0.1;
    0.4^5 0.4^3 0.4;];
b = [1;0.4802;0.8838];
A\b
%}
%最后求得 [k b m] = [16 -20 5]
