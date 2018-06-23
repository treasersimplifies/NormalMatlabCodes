%{
p = [1 -14 72 -168 191 -154 120];
roots(p);

A = [1 4 5; 8 2 9; 1 3 4];
norm(A,1);
norm(A,2);
norm(A,inf);
E = [1 0 0; 0 1 0; 0 0 1];
A\E;

B = [1 2 1 4;2 0 4 3; 4 2 2 1; -3 1 3 2];
b = [13 28 20 6]';
X = B\b

2.1
x = [0 1 2 3];
y = [1 3 9 27];
symx = sym('x');
p = polyinterp(x,y,symx)
simplify(p)

symt = sym('t');
p = 2*(symt-1)^3;
diff(p)

k = 0;
x = 1;
prevx = 2;
while abs(x-prevx) > eps*abs(x)
    xprev = x;
    x = 1/3*(2*x+2/(x^2));
end
x

4.2/3
t = [-1.5 0 1 1.5];
y = [-3 1 -2 -5]';
x = [ones(size(t)) ; t.^2]';
A = x\y

5
x = 0:0.001:2;
z = 0;
y(1) = 1/(1+3*x(1)^2);
k = 2;
while x(k) < 2 
    p(k)=(x(k)+x(k-1))/2;
    
    z = z + 1/(1+3*(p(k))^2)*0.001;
    k = k+1;
end
z;

F = @(x) 1/(1+3*x.^2);
quadtx(F,0,2);


6.1
t0 = 0;
y0 = 0;
tfinal = 1;
f = @(x,y) 1/(1+x.^2)-2*y.^2;
h = 0.25;
t = t0;
y = y0;
while t<tfinal
    y = y+h*f(t,y);
    t =t+h;
end

%}

t0 = 1;
y0 = 1;
tfinal = 2;
f = @(t,y) y/(2*t) +t.^2/(2*y);
h = 0.25;
t = t0;
y = y0;
while t<tfinal
    s1 = f(t,y);
    s2 = f(t+h/2,h*s1/2);
    s3 = f(t+h/2,h*s2/2);
    s4 = f(t+h,h*s3);
    y = y + h*(s1+s2+s3+s4)/6;
    t =t+h;
end
y;
t;
m = 2^(1/3)




