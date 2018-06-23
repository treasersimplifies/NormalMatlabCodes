%�õ���Ҫ��С���˷����ʹ�õ����ݣ�
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);
%�ļ����ܣ����ļ����У���3��figͼ���ļ���Ȼ������ļ��������룬��������.m�ļ����ݺ����һ��
%�޷��ǰѸ���С����ֿ����˶��ѡ�
%---------(a)
x = 1:1:11;
p1 = polyfit(x,y,1);%p1��ʾ����Ϊ1�Ķ���ʽ��ϣ�����ǰ��ϵ�� y = a + bx
p2 = polyfit(x,y,2);
p3 = polyfit(x,y,3);
p4 = polyfit(x,y,4);
p5 = polyfit(x,y,5);
p6 = polyfit(x,y,6);
p7 = polyfit(x,y,7);
p8 = polyfit(x,y,8);
p9 = polyfit(x,y,9);
p10 = polyfit(x,y,10);

y1 = polyval(p1,x);
y2 = polyval(p2,x);
y3 = polyval(p3,x);
y4 = polyval(p4,x);
y5 = polyval(p5,x);
y6 = polyval(p6,x);
y7 = polyval(p7,x);
y8 = polyval(p8,x);
y9 = polyval(p9,x);
y10 = polyval(p10,x);

%plot(x,y,'o',x,y1,'-',x,y2,'-',x,y3);
%plot(x,y,'o');

for i = 1:1:11
    deltay1(i) = y1(i) - y(i);
    deltay2(i) = y2(i) - y(i);
    deltay3(i) = y3(i) - y(i);
    deltay4(i) = y3(i) - y(i);
    %����ʡ��deltay4��deltay10
    y0(i) = 0; %��������y=0
end

%�ֱ�ʹ�ú�ɫ����ɫ����ɫ����ɫ��עy0/deltay1/deltay2/deltay3

plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');

%{
��
��plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');
�μ�5_7_a___.fig�ļ��������˸�ͼ�񣬿��Բ鿴ʣ�ࡣ
Ϊ�˺���ĳ���������ʱ���������ע���ˡ�
��������2��polt���������Թ۲쵽����������2��ʱ���������������ԭ�����Ѿ�����ϵĺܺã����Ҵ���Խ�ߣ�
���ԽС��deltay2�Ժ���y0�ǳ��ӽ���������matlabҲ�����warning��
���������Ŵ����������𽥼�С.
%}

%----------(b)
f1 = @(a,x) a(1)*x;
deltaf1 = @(a,x) a(1)*x-erf(x);
a = nlinfit(x,y,f1,0.08);
yf1 = f1(a,x);
deltayf1 = deltaf1(a,x);

f3 = @(b,x) b(1)*x + b(2)*x.^3;
deltaf3 = @(b,x) b(1)*x + b(2)*x.^3 - erf(x);
b = nlinfit(x,y,f3,[1 1]);
deltayf3 = deltaf3(b,x);
yf3 = f3(b,x);

f5 = @(c,x) c(1)*x + c(2)*x.^3 + c(3)*x.^5;
deltaf5 = @(c,x) c(1)*x + c(2)*x.^3 + c(3)*x.^5 - erf(x);
c = nlinfit(x,y,f5,[1 1 1]);
deltayf5 = deltaf5(c,x);
yf5 = f5(c,x);

f7 = @(d,x) d(1)*x + d(2)*x.^3 + d(3)*x.^5 + d(4)*x.^7;
deltaf7 = @(d,x) d(1)*x + d(2)*x.^3 + d(3)*x.^5 + d(4)*x.^7 - erf(x);
d = nlinfit(x,y,f7,[1 1 1 1]);
deltayf7 = deltaf7(d,x);
yf7 = f7(d,x);

f9 = @(e,x) e(1)*x + e(2)*x.^3 + e(3)*x.^5 + e(4)*x.^7 + e(5)*x.^9;
deltaf9 = @(e,x) e(1)*x + e(2)*x.^3 + e(3)*x.^5 + e(4)*x.^7 + e(5)*x.^9 - erf(x);
e = nlinfit(x,y,f9,[1 1 1 1 1]);
deltayf9 = deltaf9(e,x)
yf9 = f9(e,x);

plot(x,y0,'o',x,deltayf3,'r',x,deltayf5,'g',x,deltayf7,'b',x,deltayf9,'black');

%{
�𣺲μ�5_7_b___.fig�鿴ʣ��ͼ�񣬴˴�û�л��Ƴ�deltayfy1������Ϊ���ͼ��������ԱȺ���Ĵ�Ϊ���о�����
���Ĺ��ɣ�������Ҫ�����о������ͼ��
    �����������ݱ����з���һ�������ԣ��������ݵ���ϣ��ڴ�����1������7ʱ�����ļ�С��δ��֮ǰ��ô���ԡ�
��deltayf1��deltayf9Ҳ���Կ������ǳ���ֵ��Ǵ������Ӻ�����С�����ԣ����Ǳ仯�Ĺ��ɶ�����ͬ�ģ�����x�ı��
����ȱ��Ȼ���С��ת�۵���x=2.
%}

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
�𣺿�ͼ���ֵ�x>5ʱ�����㶨����Ϊ-0.3����,�μ�5_7_c___.fig�鿴ʣ��ͼ��


%}
