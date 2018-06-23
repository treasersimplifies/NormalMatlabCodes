%log(x)默认为以e为底
F = @(x) cos(log(x)./x)./x;
f = @(x,k) log(x)./x+(k-1/2)*pi';
   
format long
format compact

tol = 1.e-15;
xk1 = 1;
if exist('lambertw') == 2
   p = pi/2;
   xk = lambertw(p)/p;
else
   xk = fzero(f,[.4 .5],optimset,1);
end
%---------(c)
%
%
Tk = quadl(F,xk,xk1,tol);
s_plus = Tk;  
s_minus = 0;
t_k2 = 0;
t_k1 = 0;
tk = Tk;
k=2;

while(k<=50000)
   xk1 = xk;
   if good
      p = (2*k-1)*pi/2;
      xk = lambertw(p)/p;
   else
      xk = fzero(f,[xk/2 xk],opts,k);
   end

   Tk = quadl(F,xk,xk1,tol);
   
   if Tk > 0 
      s_plus = s_minus + Tk;
   else
      s_minus = s_plus + Tk;
   end
   t = (s_minus+s_plus)/2;
   
   t_k2 = t_k1;
   t_k1 = tk;
   tk = t;
   t = t_k2-(tk-t_k1)^2/(tk-2*t_k1+t_k2);
   
    if mod(k,100) == 0
      fprintf(1,'%5.0d %15.15f\n',k,t) 
    end
   k=k+1; 
end

%最后得到t = 0.323 367 431 677 789 其中前13位应该是准确的，比
%之前得到的T=0.323357778852545精确



