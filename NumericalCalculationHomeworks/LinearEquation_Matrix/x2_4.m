%{
设vs = 5v
[r12 r13 r14 r23; r25 r34 r35 r45]
=[12 13 14 23; 25 34 35 45]
%}


%1-用Ri = b求解
R = [25+12+14+45 -12 -14 -45;
    -12 23+12+13 -13 0;
    -14 -13 14+13+34 -34;
    -45 0 -34 35+45+34];
b = [0;0;0;50];
i = R\b
%{
解得：
i =
    0.5310
    0.3112
    0.6590
    0.8448
%}

%2-用Gv = c求解
G = [1/12+1/13+1/14 -1/12 -1/13 -1/14;
    -1/12 1/12+1/23+1/25 -1/23 0;
    -1/13 -1/23 1/13+1/23+1/34+1/35 -1/34;
    -1/14 0 -1/34 1/14+1/34+1/45]
c = [0;0;1/35*50;0];
v = G\c
%{
解得：
v =
   15.9120
   13.2749
   20.4335
   14.1193
%}

%下面进行验证。

v1 = 15.9120;
v2 = 13.2749;
v3 = 20.4335;
v4 = 14.1193;
i1 = 0.5310;
i2 = 0.3112;
i3 = 0.6590;
i4 = 0.8448;

%验证节点1到2的欧姆定律。
disp('验证节点1到2的欧姆定律:');
v2-v1
12*(i2-i1)
%验证节点1到4的欧姆定律。
disp('验证节点1到4的欧姆定律:');
v1-v4
14*(i3-i1)
%验证节点1到3的欧姆定律。
disp('验证节点1到3的欧姆定律:');
v3-v1
13*(i3-i2)
%验证节点2到3的欧姆定律。
disp('验证节点2到3的欧姆定律:');
v3-v2 
23*i2
%验证节点3到4的欧姆定律。
disp('验证节点3到4的欧姆定律:');
v3-v4
34*(i4-i3)
%验证节点2到5的欧姆定律。
disp('验证节点2到5的欧姆定律:');
v2-0
25*(i1)
%验证节点4到5的欧姆定律。
disp('验证节点4到5的欧姆定律:');
v4-0
45*(i4-i1)
%验证节点3到5的欧姆定律。
disp('验证节点3到5的欧姆定律:');
50-v3
35*i4

%总结，由于取值得时候舍弃了小数的后几位，所以最后稍有差距。
