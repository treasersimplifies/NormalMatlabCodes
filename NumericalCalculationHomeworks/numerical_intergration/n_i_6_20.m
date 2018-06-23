syms s h
P = @(s,h,y2,y1,d2,d1) ((3*h*s.^2-2*s.^3)*y2)./(h.^3) + ((h.^3-3*h*s.^2+2*s.^3)*y1)./(h.^3) + (s.^2*(s-h)*d2)./(h.^2) + (s*(s-h).^2*d1)./(h.^2);

intP = int(P,s);%求P的不定积分

%求得P的不定积分为
%intP =
%(d1/(4*h^2) + d2/(4*h^2) + y1/(2*h^3) - y2/(2*h^3))*s^4 
%+ (y2/h^2 - d2/(3*h) - y1/h^2 - (2*d1)/(3*h))*s^3 + (d1*s^2)/2 + y1*s

intP_h = subs(intP,s,h);%将s用h代替，得到所要求的积分

the_result_of_h_to_0_Pds = simplify(intP_h);%化简

disp(the_result_of_h_to_0_Pds);
%{
由此得到了
积分结果(h*(6*y1 + 6*y2 + d1*h - d2*h))/12
其中   y1指代y(k),    y2指代y(k+1）,
      d1指代d(k),    d2指代d(k+1);
本题得证。

%}