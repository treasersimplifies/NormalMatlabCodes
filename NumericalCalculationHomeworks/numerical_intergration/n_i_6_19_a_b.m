%log(x)Ĭ��Ϊ��eΪ��
format long 
F = @(x) cos(log(x)./x)./x;
tol = 1.e-6;
k = 2;
x(1) = 1;%x��2��ʼΪ�������õ�ֵ��
T(1)=0;
%%%�ٶȷǳ�������
t = 0;
%---------(a)&(b)
disp('start');
while(k<30000)
    f = @(x) log(x)./x+(k-1/2)*pi;
    x(k)=fzero(f,[tol 1]);      %start from x(2)
    T(k)=quad(F,x(k),x(k-1));   %start from T(2)
    k = k + 1;
    t = t+T(k-1);%ֱ�ӵô���t�Ľ����
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
�𣺵õ��� 0.323377146494892, 4λ׼ȷ��
����T(k-1) = -1.914836145487005e-05 ; T(k) = 1.914772923174024e-05 ;
�ʲ�ȷ���ȴ���Ϊ 2e-05;
%}

%---------(c)
%�ڽ����������ʱ������x(k)�����ʱ�ģ��������x(k)��ʱ�򣬿�����Aitken����
%�����n_i_6_19_c





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






