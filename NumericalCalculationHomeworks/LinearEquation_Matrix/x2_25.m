
%pagerank
%�裺alpha=1; beta=2; gamma=3; delta=4; sigma=5; rho=6;
% a:
i = [1 1 2 2 3 4 5 6];
j = [2 3 3 4 4 1 6 5];
n = 6;
G = sparse(i,j,1,n,n)
c = full(sum(G))
p = 0.85;           %�������ʱѡ��ǰ��ҳ�����ӵĸ��ʣ�Ҳ���������ҳʱ�������ҳ�еĳ����ӵĸ��ʡ�
delta = (1-p)/n;
e = ones(n,1);
I = speye(n,n);
G = full(G)
D = spdiags(1./c',0,n,n);
%����ֱ����G=G./c,Ȼ��Ͱ�G*D����G
X1 = (I - p*G*D)\(delta*e)
%{
�õ������Ӿ���G=
     0     1     1     0     0     0
     0     0     1     1     0     0
     0     0     0     1     0     0
     1     0     0     0     0     0
     0     0     0     0     0     1
     0     0     0     0     1     0
%}


%c:��p������0

clear

i = [1 1 2 2 3 4 5 6];
j = [2 3 3 4 4 1 6 5];
n = 6;
G = sparse(i,j,1,n,n)
c = full(sum(G))
p = 0;           %p=0
delta = (1-p)/n;
e = ones(n,1);
I = speye(n,n);
G = full(G)
D = spdiags(1./c',0,n,n);
%����ֱ����G=G./c,Ȼ��Ͱ�G*D����G
X1 = (I - p*G*D)\(delta*e)

