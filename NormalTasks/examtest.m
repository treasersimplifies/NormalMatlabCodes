
x0 = 2.4;
y0 = 1.5;

for testx = 0:0.2:3;
    x = [testx testx testx testx];
    if testx>=0.4&&testx<=2.6
        for testy = 0:0.8:3
            y = [testy testy+0.2 testy+0.4 testy+0.6];
            newexam(x0,y0,x,y);
            pause(0.7);
        end
    else
        for testy = 0.4:0.8:2.4
            y = [testy testy+0.2 testy+0.4 testy+0.6];
            newexam(x0,y0,x,y);
            pause(0.7);
        end
    end
end

%newexam(1.5,1.5,[1.3 1.4 1.6 1.7],[0.4 0.4 0.4 0.4])
%newexam(1.5,1.5,[1 0.95 1.5 2.05],[2 2.05 2.6 2.05])
%newexam(1.5,1.5,[1.2 1.2 1.8 1.8],[1.2 1.8 1.2 1.8])
%[a b c]=newexam(1.5,1.5,[1.2 1.2 1.2 1.2],[0 0.2 0.7 0.6])
%newexam(1.5,1.5,[1.2 1.2 1.2 1.2],[0 0.4 0.8 1.2])
%{
     
        
    y1(i) = k(i)*(0-x0)+y0;     %得到直线在x=0的y值
    y2(i) = k(i)*(0.4-x0)+y0;   %得到直线在x=0.4的y值
    y3(i) = k(i)*(2.6-x0)+y0;   %得到直线在x=2.6的y值
    y4(i) = k(i)*(3-x0)+y0;     %得到直线在x=3的y值
    
    if (y1(i)-0.4)*(y2(i)-0)<=0&&((x0-x(i))*(x(i)-0.4)>=0)%保证直线有交点且有击球方向
        flag(i,1) = 1;%表明可以直线与目标区1有交点，且花球在白球和目标区之间，可击球
    else
        flag(i,1) = 0;
    end
    
    if (y1(i)-2.6)*(y2(i)-3)<=0&&((x0-x(i))*(x(i)-0.4)>=0)
        flag(i,2) = 1;%表明可以直线与目标区2有交点，且花球在白球和目标区之间，可击球
    else
        flag(i,2) = 0;
    end
    
    if (y3(i)-3)*(y4(i)-2.6)<=0&&((x0-x(i))*(x(i)-2.6)>=0)
        flag(i,3) = 1;
    else
        flag(i,3) = 0;
    end
    
    if (y3(i)-0)*(y4(i)-0.4)<=0&&((x0-x(i))*(x(i)-2.6)>=0)
        flag(i,4) = 1;
    else
        flag(i,4) = 0;
    end
%}