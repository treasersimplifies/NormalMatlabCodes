%log(x)默认为以e为底
format long 
F = @(x) cos(log(x)./x)./x;
tol = 1.e-6;
k = 2;
x(1) = 1;%x从2开始为各个可用的值。
T(1)=0;
%%%速度非常慢……
t = 0;
%---------(a)&(b)
disp('start');
while(k<30000)
    f = @(x) log(x)./x+(k-1/2)*pi;
    x(k)=fzero(f,[tol 1]);      %start from x(2)
    T(k)=quad(F,x(k),x(k-1));   %start from T(2)
    k = k + 1;
    t = t+T(k-1);%直接得打了t的结果。
    if mod(k,100)==0
        disp(t);
        fprintf(1,'%5.0d  %10.15lf',k,t);
    end
    %disp(x(k-1));
    %disp(T(k-1));
end
disp(k);
disp('over');


%{
答：得到了 0.323377146494892, 4位准确。
由于T(k-1) = -1.914836145487005e-05 ; T(k) = 1.914772923174024e-05 ;
故不确定度大致为 2e-05;
%}

%---------(c)
%在解决上述问题时，求解除x(k)是最耗时的，因此在求x(k)的时候，可以用Aitken加速
%程序见n_i_6_19_c





%{
useless code:

n=2;
T2(1) = 0;
t2 = 0;
while(n<k-1)
    T2(n) = T(n)-(T(n+1)-T(n))^2/(T(n+1)-2*T(n)+T(n-1));
    t2=t2+T2(n);
    n=n+1;
    if mode(n,1000)
        out = [n t2];
        disp(out);
    end
end
%}






