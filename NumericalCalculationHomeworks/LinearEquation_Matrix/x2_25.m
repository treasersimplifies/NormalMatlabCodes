
%pagerank
%设：alpha=1; beta=2; gamma=3; delta=4; sigma=5; rho=6;
% a:
i = [1 1 2 2 3 4 5 6];
j = [2 3 3 4 4 1 6 5];
n = 6;
G = sparse(i,j,1,n,n)
c = full(sum(G))
p = 0.85;           %随机漫步时选择当前网页的链接的概率，也就是浏览网页时点击了网页中的超链接的概率。
delta = (1-p)/n;
e = ones(n,1);
I = speye(n,n);
G = full(G)
D = spdiags(1./c',0,n,n);
%或者直接用G=G./c,然后就把G*D换成G
X1 = (I - p*G*D)\(delta*e)
%{
得到了连接矩阵G=
     0     1     1     0     0     0
     0     0     1     1     0     0
     0     0     0     1     0     0
     1     0     0     0     0     0
     0     0     0     0     0     1
     0     0     0     0     1     0
%}


%c:若p趋向于0

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
%或者直接用G=G./c,然后就把G*D换成G
X1 = (I - p*G*D)\(delta*e)

