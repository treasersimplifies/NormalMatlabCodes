%�õ���Ҫ��С���˷����ʹ�õ����ݣ�
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);

%--------��c)

%z = @(t) 1\(1+t);
F = @(cp,t) cp(1)+(cp(2)+cp(3)*(1\(1+t))+cp(4)*(1\(1+t)).^2+cp(5)*(1\(1+t)).^3).*exp(-t.^2);
%yz = z(x);
cp = nlinfit(x,y,F,10^7*[0 1 1 1 1])
yF = F(cp,x);

deltaF = @(cp,t) cp(1)+(cp(2)+cp(3)*(1\(1+t))+cp(4)*(1\(1+t)).^2+cp(5)*(1\(1+t)).^3).*exp(-t.^2)-erf(t);
deltayF = deltaF(cp,x);

plot(x,y0,'o',x,deltayF,'-');

%{
�𣺿�ͼ���ֵ�x>5ʱ�����㶨����Ϊ-0.3����


%}
