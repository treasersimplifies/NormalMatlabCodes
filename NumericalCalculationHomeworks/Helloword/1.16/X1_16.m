bg = [255 128 0];
fg = [128 64 0];%��ɫ����
sz = get(0,'screensize');
rand('state',0)
X = finitefern(500000,sz(4),sz(3));%����ާ����
d = fg - bg;
R = uint8(bg(1)+d(1)*X);
G = uint8(bg(2)+d(2)*X);
B = uint8(bg(3)+d(3)*X);
F = cat(3,R,G,B);
imwrite(F,'myfern.png','png','bitdepth',8)

%{
���ȷֲ�������������
�﷨
Y = rand(n)
Y = rand(m,n)
Y = rand([m n])
Y = rand(m,n,p,...)
Y = rand([m n p...])
Y = rand(size(A))
rand
s = rand('state')
����
rand������������(0, 1)֮����ȷֲ����������ɵ����顣
Y = rand(n) ����һ��n x n������������n�����������򷵻ش�����Ϣ��
Y = rand(m,n) �� Y = rand([m n]) ����һ��m x n���������
Y = rand(m,n,p,...) �� Y = rand([m n p...]) ����������顣
Y = rand(size(A)) ����һ����A����ͬ�ߴ���������

1��rand(3)*-2   rand��3����һ��3*3�����������ֵ��Χ��0~1֮�䣩
Ȼ�����ÿ��������-2

2 ����matlab�������60��1��365֮�������   1+fix��365*rand��1��60������

3����rand�������ȡ100����-1��1����x1��x2��...��x = rand(1,100) * 2 - 1
%}


%{
cat��������������
�÷���C = cat(dim, A, B)       ��dim������A��B�������顣
      C = cat(dim, A1, A2, A3, ...)    ��dim����������������顣
      e.g.
      a=cat(3,A,B) �����ź��3��ʾ������ľ���ά�������µľ����е�1��2ά����A��B�������������������������3ά��A��B����������ľ����������Ϊ2
cat(2, A, B)�൱��[A, B];
cat(1, A, B)�൱��[A; B].
ʹ�á�,���ָ��б����﷨��cat(dim, C{:})��cat(dim, C.field)�����ǽ��������ݾ����cell��ṹ��������Ϊһ������ķ��㷽ʽ��
���磺
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
>> cat(1, A, B) %�������ӣ�������ͬ��
ans =
    1     2
    3     4
    5     6
    7     8
>> cat(2, A, B) %�������ӣ�������ͬ��
ans =
    1     2     5     6
    3     4     7     8
>> cat(3, A, B) %�ϳ�Ч������ͼ
ans(:,:,1) =
    1     2
    3     4
ans(:,:,2) =
    5     6
    7     8
 
a = magic(3) 
b = pascal(3) 
k=1,�ϲ������� [a;b],�����Ӿ���Ҫ��a,b��������Ȳ��ܺϲ�����
>> c = cat(1,a,b) 
c = 
     8     1     6
     3     5     7
     4     9     2
     1     1     1
     1     2     3
     1     3     6
k=2,�ϲ�������[a,b],�����Ӿ���Ҫ��a,b��������Ȳ��ܺϲ���
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
nά�ľ���ϲ���Ҫ��n-1άά����Ȳſ���. 
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