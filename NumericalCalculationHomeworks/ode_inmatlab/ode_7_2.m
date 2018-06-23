
y0 = 100;
a = 0;
b = 10;
r = 0.06;
%1)---------euler in year
h=1;
x = a:b;
y(1) = y0;
for n = 1:10
    y(n+1) = y(n) + h*(r*y(n));
end
euler_year = y(n+1)
%-:得到y = 179.0847696542854

%2)---------euler in month
h=1/12;
x = a:h:b;
y(1) = y0;
for n = 1:10/h
    y(n+1) = y(n) + h*(r*y(n));
end
euler_month = y(n+1)
%--:得到y = 181.9396734032313

%3)---------midpoint in month
h=1/12;
y(1) = y0;
for n = 1:10/h
   s1 = r*y(n);
   s2 = r*(y(n) + h/2*s1);
   y(n+1) = y(n) + h*s2;
end
midpoint_month = y(n+1)
%---:得到y = 182.2114262147358

%4)---------trapezoid in month
h=1/12;
y(1) = y0;
for n = 1:10/h
   s1 = r*y(n);
   s2 = r*(y(n) + h*s1);
   y(n+1) = y(n) + h*(s1+s2)/2;
end
trapezoid_month = y(n+1)
%---:得到y = 182.2114262147358

%5)----------BS23 in month
h=1/12;
y(1) = y0;
s4 = r*y(1);
for n = 1:10/h
   s1 = s4;
   s2 = r*(y(n) + h*s1/2);
   s3 = r*(y(n) + 3*h*s2/4);
   y(n+1) = y(n) + h/9*(2*s1+3*s2+4*s3);
   s4 = r*y(n+1);
end
bs23_month = y(n+1)
%-----:得到y = 182.2118794719117

%6)----------continuous
continuous = y0*exp(r*10)
%------:得到y = 182.2118800390509

[euler_year euler_month midpoint_month trapezoid_month bs23_month continuous]
