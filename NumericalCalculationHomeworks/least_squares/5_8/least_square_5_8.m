t = 1:25;
y = [ 5.0291  6.5099  5.3666  4.1272  4.2948 6.1261 12.5140 10.0502  9.1614  7.5677 7.2920 10.0357 11.0708 13.4045 12.8415 11.9666 11.0765 11.7774 14.5701 17.0440 17.0398 15.9069 15.4850 15.5112 17.5672]
%用书上的代码得到的y向量不对，所以直接写成了这种样子

y0 = zeros(1,25);
 %---------(a)
 beta = polyfit(t,y,1);
 y1 = polyval(beta,t);
 deltay1 = y1 - y;%拟合剩余：y(tk) - yk
 
 plot(t,y0,'black',t,deltay1,'r');
 
 %--------(b)
 %用上面的plot函数观察可以看到应该是 y = 12.5140为一局外点,去掉后，将t和y修改为tb和yb：
 yb = [ 5.0291  6.5099  5.3666  4.1272  4.2948 6.1261 10.0502  9.1614  7.5677 7.2920 10.0357 11.0708 13.4045 12.8415 11.9666 11.0765 11.7774 14.5701 17.0440 17.0398 15.9069 15.4850 15.5112 17.5672]
 tb = 1:24;
 beta2 = polyfit(tb,yb,1);%用yb进行拟合
 y2 = polyval(beta2,tb);
 deltay2 = y2 - yb;
 y0b = zeros(1,24);
 plot(tb,y0b,'black',tb,deltay2,'r');
 %{
 答：观察本文件中的5_8_a___.fig和5_8_b___.fig文件可以发现，剩余的图像会在y=0上下波动，
 并且大致对称，不过在5_8_b___.fig中由于去掉了局外点，所以对称更好了，而且最大误差也小了：
 在5_8_a___.fig中最大误差超过了-4，在5_8_b___.fig最大不超过-2.5
 %}
 
 %----------(c) and (d)
 
 f1 = @(b,t) b(1) + b(2)*t + b(3)*sin(t);
 b = nlinfit(tb,yb,f1,[1 1 1])
 yf1 = f1(b,tb); 
 %拟合出来以后，再用更精确的方法在区间[0，26]上绘图,即tc
 tc = 0:0.25:26;
 yf2 = f1(b,tc);
 plot(tb,yb,'o',tc,yf2,'-',7,12.5140,'*');
 %上plot函数能完成（d）的要求，所得图像见5_8_d___.fig.
 
 