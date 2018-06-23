
f = @(x) x^(1/3)
g = @(x) 1/3*x^(-2/3)
x=[];
y=[];
d=[];
x(1) = 0.6;
y(1) = f(1);
k(1) = g(1);
i=1;
while(1)
    u=1;
    y(i) = f(x(i))
    k(i) = g(x(i))
    x(i+1) = -u*y(i)/k(i) + x(i)
    y(i+1) = f(x(i+1))
    while(abs(y(i+1))>=abs(y(i)))
        u=u/2;
        y(i)=f(x(i));
        k(i) = g(x(i));
        x(i+1) = -u*y(i)/k(i) + x(i);
        y(i+1)=f(x(i+1));
        i =i+1;
    end
    
    if(abs(y(i+1))<abs(y(i)))
        i = i+1;
    end
    
    if(x(i+1)-x(i)<eps)
        break;
    end
end

disp(x(i))


    
    
    