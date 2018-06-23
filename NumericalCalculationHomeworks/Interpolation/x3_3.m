
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
%���ͼ��������Ӧ�ı�ʾ

%b��
piecelin_y = piecelin(x,y,-0.3)
polyinterp_y = polyinterp(x,y,-0.3)
splinetx_y = splinetx(x,y,-0.3)
pchiptx_y = pchiptx(x,y,-0.3)
%{
�õ��ˣ�
pieceline_y =   0.4300

polyinterp_y =  -0.9990

spline_y =  -0.1957

pchip_y =   0.4322
%}

%c)
%���������շ������߹۲�ͼ�񣬿���֪������ʹζ���ʽ�ض����溯�����������������շ��ñ�Ϊ5�Ρ�
%��˿����� y = kx^5+bx^3+mx��
%{
A = [1 1 1;
    0.1^5 0.1^3 0.1;
    0.4^5 0.4^3 0.4;];
b = [1;0.4802;0.8838];
A\b
%}
%������ [k b m] = [16 -20 5]
