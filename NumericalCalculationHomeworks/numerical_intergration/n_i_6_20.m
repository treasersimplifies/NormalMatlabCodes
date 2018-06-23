syms s h
P = @(s,h,y2,y1,d2,d1) ((3*h*s.^2-2*s.^3)*y2)./(h.^3) + ((h.^3-3*h*s.^2+2*s.^3)*y1)./(h.^3) + (s.^2*(s-h)*d2)./(h.^2) + (s*(s-h).^2*d1)./(h.^2);

intP = int(P,s);%��P�Ĳ�������

%���P�Ĳ�������Ϊ
%intP =
%(d1/(4*h^2) + d2/(4*h^2) + y1/(2*h^3) - y2/(2*h^3))*s^4 
%+ (y2/h^2 - d2/(3*h) - y1/h^2 - (2*d1)/(3*h))*s^3 + (d1*s^2)/2 + y1*s

intP_h = subs(intP,s,h);%��s��h���棬�õ���Ҫ��Ļ���

the_result_of_h_to_0_Pds = simplify(intP_h);%����

disp(the_result_of_h_to_0_Pds);
%{
�ɴ˵õ���
���ֽ��(h*(6*y1 + 6*y2 + d1*h - d2*h))/12
����   y1ָ��y(k),    y2ָ��y(k+1��,
      d1ָ��d(k),    d2ָ��d(k+1);
�����֤��

%}