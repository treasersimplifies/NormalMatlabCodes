%得到需要最小二乘法拟合使用的数据：
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);
%文件介绍：本文件夹中，有3个fig图像文件，然后这个文件是主代码，其他三个.m文件内容和这个一样
%无非是把各个小题给分开来了而已。
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
用plot(x,y0,'r',x,deltay1,'g',x,deltay2,'b',x,deltay3,'black');
参见5_7_a___.fig文件，保存了该图像，可以查看剩余。
为了后面的程序，所以暂时把这条语句注释了。
由以上这2个polt函数都可以观察到当次数高于2次时，拟合所得曲线与原数据已经能拟合的很好，并且次数越高，
误差越小（deltay2以后与y0非常接近），但是matlab也会出现warning。
最大误差随着次数的增加逐渐减小.
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
答：参见5_7_b___.fig查看剩余图像，此处没有绘制出deltayfy1，是因为这个图像误差明显比后面的大，为了研究误差变
化的规律，所以重要的是研究后面的图像。
    由于所得数据本身有符合一定的线性，奇数次幂的拟合，在次数从1上升到7时，误差的减小并未像之前那么明显。
从deltayf1到deltayf9也可以看出。非常奇怪的是次数增加后，误差变小不明显，但是变化的规律都是相同的，随着x的变大
误差先变大，然后变小，转折点在x=2.
%}

%--------（c)

%z = @(t) 1\(1+t);
F = @(cp,t) cp(1)+(cp(2)+cp(3)*(1\(1+t))+cp(4)*(1\(1+t)).^2+cp(5)*(1\(1+t)).^3).*exp(-t.^2);
%yz = z(x);
cp = nlinfit(x,y,F,10^7*[0 1 1 1 1])
yF = F(cp,x);

deltaF = @(cp,t) cp(1)+(cp(2)+cp(3)*(1\(1+t))+cp(4)*(1\(1+t)).^2+cp(5)*(1\(1+t)).^3).*exp(-t.^2)-erf(t);
deltayF = deltaF(cp,x);

plot(x,y0,'o',x,deltayF,'-');

%{
答：看图像发现当x>5时，误差恒定不变为-0.3左右,参见5_7_c___.fig查看剩余图像。


%}
