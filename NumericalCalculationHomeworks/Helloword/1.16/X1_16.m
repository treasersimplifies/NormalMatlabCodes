bg = [255 128 0];
fg = [128 64 0];%颜色矩阵
sz = get(0,'screensize');
rand('state',0)
X = finitefern(500000,sz(4),sz(3));%分形蕨？？
d = fg - bg;
R = uint8(bg(1)+d(1)*X);
G = uint8(bg(2)+d(2)*X);
B = uint8(bg(3)+d(3)*X);
F = cat(3,R,G,B);
imwrite(F,'myfern.png','png','bitdepth',8)

%{
均匀分布的随机数或矩阵
语法
Y = rand(n)
Y = rand(m,n)
Y = rand([m n])
Y = rand(m,n,p,...)
Y = rand([m n p...])
Y = rand(size(A))
rand
s = rand('state')
描述
rand函数产生由在(0, 1)之间均匀分布的随机数组成的数组。
Y = rand(n) 返回一个n x n的随机矩阵。如果n不是数量，则返回错误信息。
Y = rand(m,n) 或 Y = rand([m n]) 返回一个m x n的随机矩阵。
Y = rand(m,n,p,...) 或 Y = rand([m n p...]) 产生随机数组。
Y = rand(size(A)) 返回一个和A有相同尺寸的随机矩阵。

1，rand(3)*-2   rand（3）是一个3*3的随机矩阵（数值范围在0~1之间）
然后就是每个数乘上-2

2 ，用matlab随机产生60个1到365之间的正数   1+fix（365*rand（1，60））；

3，用rand函数随机取100个从-1到1的数x1，x2，...，x = rand(1,100) * 2 - 1
%}


%{
cat：用来联结数组
用法：C = cat(dim, A, B)       按dim来联结A和B两个数组。
      C = cat(dim, A1, A2, A3, ...)    按dim联结所有输入的数组。
      e.g.
      a=cat(3,A,B) 左括号后的3表示构造出的矩阵维数；在新的矩阵中第1、2维就是A和B这两个矩阵的行数和列数，第3维是A和B这两个矩阵的矩阵个数，即为2
cat(2, A, B)相当于[A, B];
cat(1, A, B)相当于[A; B].
使用“,”分割列表的语法，cat(dim, C{:})或cat(dim, C.field)，这是将包含数据矩阵的cell或结构数组联合为一个数组的方便方式。
例如：
>> A = [1 2; 3 4];
>> B = [5 6; 7 8];
>> A
A =
    1     2
    3     4
>> B
B =
    5     6
    7     8
>> cat(1, A, B) %按列连接（列数相同）
ans =
    1     2
    3     4
    5     6
    7     8
>> cat(2, A, B) %按行连接（行数相同）
ans =
    1     2     5     6
    3     4     7     8
>> cat(3, A, B) %合成效果如下图
ans(:,:,1) =
    1     2
    3     4
ans(:,:,2) =
    5     6
    7     8
 
a = magic(3) 
b = pascal(3) 
k=1,合并后形如 [a;b],行添加矩阵（要求a,b的列数相等才能合并）；
>> c = cat(1,a,b) 
c = 
     8     1     6
     3     5     7
     4     9     2
     1     1     1
     1     2     3
     1     3     6
k=2,合并后形如[a,b],列添加矩阵（要求a,b的行数相等才能合并）
>> c = cat(2,a,b) 
c = 
     8     1     6     1     1     1
     3     5     7     1     2     3
     4     9     2     1     3     6
>> c = cat(3,a,b) 
c(:,:,1) = 
     8     1     6
     3     5     7
     4     9     2
c(:,:,2) = 
     1     1     1
     1     2     3
     1     3     6
n维的矩阵合并，要求n-1维维数相等才可以. 
>> c = cat(4,a,b) 
c(:,:,1,1) = 
     8     1     6
     3     5     7
     4     9     2
c(:,:,1,2) = 
     1     1     1
     1     2     3
     1     3     6
%}