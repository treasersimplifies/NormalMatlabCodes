%得到需要最小二乘法拟合使用的数据：
for k = 1:1:11
    t(k) = (k-1)/10;
    y(k) = erf(t(k));
end

disp(y);

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
答：由于所得数据本身有符合一定的线性，奇数次幂的拟合，在次数从1上升到7时，误差的减小并未像之前那么明显。
从deltayf1到deltayf9也可以看出。非常奇怪的是次数增加后，误差变小不明显，但是变化的规律都是相同的，随着x的变大
误差先变大，然后变小，转折点在x=2.
%}
