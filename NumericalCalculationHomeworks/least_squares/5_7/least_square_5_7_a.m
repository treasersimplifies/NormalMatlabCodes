%�õ���Ҫ��С���˷����ʹ�õ����ݣ�
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);
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
��plot(x,y,'o',x,y1,'-',x,y2,'-',x,y3);
plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');���Բ鿴��
Ϊ�˺���ĳ���������ʱ���������ע���ˡ�
��������2��polt���������Թ۲쵽����������2��ʱ���������������ԭ�����Ѿ�����ϵĺܺã����Ҵ���Խ�ߣ�
���ԽС��deltay2�Ժ���y0�ǳ��ӽ���������matlabҲ�����warning��
���������Ŵ����������𽥼�С.
%}