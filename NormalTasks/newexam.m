
function [p_x p_y theta] = newexam(x0,y0,x,y)
%已知白球位置:
%(x0,y0)
%其他四个花球的位置为：
%(x1,y1)
%(x2,y2）
%(x3,y3)
%(x4,y4)
%设：
%球的半径为r=0.1，目标区（正方形）大小为40cm=0.4m
%当某个x(i) = 0 ,y(i) = 0时，flag(0) = [0 0 0 0];
%%%%本程序对应的情况：
%1.无球可击：小车会寻找白球与花球连的直线最接近对角线的的那个方向击。
%2.可以直接击球：若有多个击球角度，则随便选一个
%3.由于有球阻挡：也可以击球。

%----------第一步，看白球与花球的连线延长后与目标区是否有交点。
%x0 = 1.5;
%y0 = 1.5;
%x = [1.2 1.2 1.8 1.8];
%y = [1.2 1.8 1.2 1.8]
r = 0.1;

for i=1:4
    k(i) = (y(i)-y0)/(x(i)-x0);
    %每一条直线为：y = k(i)*(x-x0)+y0；
end

for i=1:4   %   i 代表一个第i个花球
    %每个区域的直线为：y = x - 2.6 / y = x - 0.4
    %  y = -x + 0.4 / y = -x + 2.6
    %x1(i) = solve('k(1)*(x-x0)+y0 = -x+0.4');
    %x2(i) = solve('k(1)*(x-x0)+y0 = x+2.6');
    %x3(i) = solve('k(1)*(x-x0)+y0 = -x+0.4');
    %x4(i) = solve('k(1)*(x-x0)+y0 = x-2.6');
    x1(i) = (x0*k(1) - y0 + 0.5)/(k(1) + 1);
    x2(i) = (x0*k(1) - y0 + 2.5)/(k(1) - 1);
    x3(i) = (x0*k(1) - y0 + 0.5)/(k(1) + 1);
    x4(i) = -(y0 - x0*k(1) + 2.5)/(k(1) - 1);
    if x1(i)<0.4&&x1(i)>0
        flag(i,1) = 1;
    else
        flag(i,1) = 0;
    end
    if x2(i)<0.4&&x2(i)>0
        flag(i,2) = 1;
    else
        flag(i,2) = 0;
    end
    if x3(i)>2.6&&x3(i)<3
        flag(i,3) = 1;
    else
        flag(i,3) = 0;
    end
    if x4(i)>2.6&&x4(i)<3
        flag(i,4) = 1;
    else
        flag(i,4) = 0;
    end
   
end
%disp(flag);
k

%此循环过后，flag中存的是否能直接击球的情况。

%----------第二步，判断能直接击球时，是否会被其他球阻挡。
i = 1;
for a = 1:4
    for b = 1:4
        if  flag(a,b)==1    %第a个花球与第b个区域可行
            while (i<=4)&&(i~=a)    %判断其他球
                if (x(a)-x0)*(x(i)-x0) >=0  %假如第i个花球的x坐标在白球、a花球的同侧
                    deltay = k(a)*(x(i)-x0)+y0 - y(i);  %得到a花球与白球的直线其上，如果在x=x(i)时的
                    if abs(deltay)<=(2*r*(1+1/(k(a))^2)^0.5);%y值与y(i)的差值小于小球的直径/cos?
                        flag(a,b) = 0;      %因为会碰到，所以flag置0
                    end
                end
                i = i+1;
            end
        end
    end
end

%{
有一种比较特殊的情况：
x = [1 0.95 1.5 2.05];
y = [2 2.05 2.6 2.05];
此时是有2个flag==1的，这是因为1号球向2号目标区时，2号球，1号球白球的
%}

%以上得到了最终的flag矩阵
disp(flag);

%----------第三步，求出小车该去的位置和姿态（目的位置坐标和小车朝向）
%简单起见，假如有多个球能击，我直接取球号较小的那个球先击
flag_for_break = 0;%在matlab程序中为了跳出2层循环我手动写的，对程序输出无影响
p_x = 0;
p_y = 0;
theta = 0;
target = 0;%表示最后决定击的那个花球的标号
x_target = 0;%表示最后决定击的那个花球的坐标
y_target = 0;
for a = 1:4
    for b = 1:4
        if flag(a,b) ==1
            x_target = x(a);
            y_target = y(a);
            target = a;
            theta = atan(k(a));%弧度制
            
            theta = theta/pi*180;%化成180角度制
            if theta < 0%将-90到90度化成0到360度
                if x0>x(a)
                    theta = theta + 180;
                else
                    theta = theta + 360;
                end
            else
                if x0>x(a)
                   theta = theta + 180;
                end
            end
            p_x = x0 - 0.1*cos(theta/180*pi);%取小车与白球的距离为0.1m
            p_y = y0 - 0.1*sin(theta/180*pi);
                
            flag_for_break = 1;%直接跳出2层循环的方式
            break;
        end
    end
    if flag_for_break == 1
        break;
    end
end

%假如顺利得拿到了一个非零矩阵flag，则求解很简单。而假如flag是零矩阵，则进入else
kd = 0;
if (p_x~=0)&&(p_y~=0)&&(theta~=0)
    position = [p_x p_y theta]
else     %根据打台球大力出奇迹的原理，找一条斜率的绝对值与1最接近的直线击球
    for i = 1:4
        sc(i) = abs(abs(k(i))-1);
    end
   	[kd target] = min(sc);
    target
    x_target = x(target);
    y_target = y(target); 
    theta = atan(k(target));%弧度制
    theta = theta/pi*180;%化成180角度制
    if theta < 0%将-90到90度化成0到360度
    	if x0>x(target)
            theta = theta + 180;
        else
            theta = theta + 360;
        end
    else
        if x0>x(target)
        	theta = theta + 180;
        end
    end
    p_x = x0 - 0.1*cos(theta/180*pi);%取小车与白球的距离为0.05m
    p_y = y0 - 0.1*sin(theta/180*pi);
    position = [p_x p_y theta]
end

%-----------第四步，用直角坐标图展示结果：
xout = x_target+(x_target-p_x)*10;
yout = y_target+k(target)*(x_target-p_x)*10;
plot(x,y,'o',x0,y0,'k:*',p_x,p_y,'r:s');
hold on;
line([0 0.4],[0.4 0.4]);
line([0.4 0.4],[0 0.4]);
line([0 0.4],[2.6 2.6]);
line([0.4 0.4],[2.6 3]);
line([2.6 3],[2.6 2.6]);
line([2.6 2.6],[2.6 3]);
line([2.6 3],[0.4 0.4]);
line([2.6 2.6],[0 0.4]);
hold on;
line([p_x xout],[p_y yout]);
axis([0 3 0 3]);
%{
可作为测试的例子：
x = [
1：flag=1，但是有一些球被挡住的情况 
    x = [1 0.95 1.5 2.05];
    y = [2 2.05 2.6 2.05];
得到：
    1.4646    1.5354   0.7854 (135.0000度)
2：flag=1，但是有一些球被挡住的情况 
    x = [1 0.95 1.5 2.05];
    y = [1 0.95 2.6 2.05];
得到：
    1.4646    1.4646  225.0000
2：flag为0矩阵
    x = [0.4  2.6  0.95 2.05];
    y = [1.5  1.5  2.6  2.6 ];
得到：
    1.4776    1.4553    1.1071（63.4349度）
newexam(1.5,1.5,[1.3 1.4 1.6 1.7],[0.4 0.4 0.4 0.4])
newexam(1.5,1.5,[1 0.95 1.5 2.05],[2 2.05 2.6 2.05])
newexam(1.5,1.5,[1.2 1.2 1.8 1.8],[1.2 1.8 1.2 1.8])
%}




                
    
        
        
    