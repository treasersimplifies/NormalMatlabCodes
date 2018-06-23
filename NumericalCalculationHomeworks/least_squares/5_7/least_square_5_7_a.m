%得到需要最小二乘法拟合使用的数据：
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);
%---------(a)
x = 1:1:11;
p1 = polyfit(x,y,1);%p1表示次数为1的多项式拟合，次数前的系数 y = a + bx
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
    %以下省略deltay4到deltay10
    y0(i) = 0; %用来绘制y=0
end

%分别使用红色、绿色、蓝色、黑色标注y0/deltay1/deltay2/deltay3

plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');

%{
答：
用plot(x,y,'o',x,y1,'-',x,y2,'-',x,y3);
plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');可以查看误差。
为了后面的程序，所以暂时把这条语句注释了。
由以上这2个polt函数都可以观察到当次数高于2次时，拟合所得曲线与原数据已经能拟合的很好，并且次数越高，
误差越小（deltay2以后与y0非常接近），但是matlab也会出现warning。
最大误差随着次数的增加逐渐减小.
%}