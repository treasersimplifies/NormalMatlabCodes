% homeworks
%{
num = [0.0025 0 1];
den = [0.025 0.2 21 80 4000];

t=0:0.01:5;
F=10*sin(30*t); Sys=tf(num,den);
y=lsim(Sys,F,t);
plot(t,y)

bode(num, den);

%}

%{

num = 1850/41*[1 6.38];
den = [1 56 100 0];
r = rlocus(num,den);
plot(r,'o');

num = 27400/41*[1 7.66];
den = [1 56 768 5120];
step(num,den)
grid

num = 100000/41*1/4*[1 54.15];
den = [1 56 768 5120];
step(num,den);
% ???
num = 688.3*[1 8.06 3.064];
den = [1 56 1436.5 10508.8 2063.5];
step(num,den);


% num = 1/4*10^5/41*[1 54.1531 0.1679]
% step(num,den)

%OLTF:
num = 2307737.6*[1 7.67];
den = [0.54 32 3607 193717 346560 0];
rlocus(num,den)
%}

%%%%%%%%%% homework 3------Mechatronic control %%%%%%%%%
%1_B
%{
num = 27400/41*[1 7.66];
den = conv(conv([1 54.15],[1 1.85]),[1 0]);
rlocus(num,den);
T = tf(num,den)
Tr = feedback(T,1,-1)
poles = roots([1,56,768.470182926829,5119.12195121951])
step(Tr)
%}
%1_D 
%{
num = 10^5/41*[1 54.15];
den = [1 56 768 5120];
Si = tf(num,den)
step(Si)
%}
%1_F/1_G
%{
num = 27400/41*conv([1 7.66],[1 0.4]);
den = conv(conv([1 0],[1 1.85]),conv([1 54.15],[1 0.0031]));
rlocus(num,den)
T= tf(num,den);
Tr = feedback(T,1,-1);
step(Tr)
den_2 = [1,56.0031000000000,768.643782926829,5386.74957464024,2047.64878048780];
num_2 = -27400/41*conv([1 54.15],[1 0.0031]);
step(num_2,den_2)
%}
%2_A
%{

num = 0.274*8422400*[1 7.67];
den = conv(conv([1 54.15],[1 0]),conv([0.54 1],[1 3.2 6400]));
rlocus(num,den)
% p = rlocfind(num,den)
Tr = feedback(T,1,-1);
p = [1,216.336000000000,22588.7535000000,1903719.01964000,114565587.382400,2693397641.06600,34793936287.2640,231284542528.000];
roots(p)
%}
%2_B
%{
%OLTF:
num = 0.0185*8422400*[1 2.83];
den = conv(conv([1 10.15],[0.54 1]),conv([1 3.2 6400],[1 0]));
T = tf(num,den)
rlocus(num,den);
%CLTF:
Tr = feedback(T,1,-1)
p = roots([0.540000000000000,8.20900000000000,3486.88920000000,41510.8800000000,220774.400000000,440954.752000000])
step(Tr)
%}
%2_C
%{
%OLTF
num = 4273588*[1 7.67];
den = conv(conv([1 0],[1 54.15]),conv(conv([1 1.85],[1 80]),[1 80]));
T = tf(num,den)
rlocus(num,den);
%CLTF
Tr = feedback(T,1,-1)
step(Tr)
poles = roots([1,216,15460.1775000000,374428.400000000,4914724,32778419.9600000])
%}
%2_D
%{
num = 4711631*conv([1 7.67],[1 3.2 6400]);
den = conv(conv(conv([1 0],[1 1.85]),conv([1 80],[1 80])),conv([1 54.15],[1 0.336 7056]));
T = tf(num,den)
rlocus(num,den)
%[k poles]=rlocfind(num,den)
Tr = feedback(T,1,-1)
poles = roots([1,216.336000000000,22588.7535000000,1903719.01964000,114565587.382400,2693397641.06600,34793936287.2640,231284542528.000])
%}
%2_E
%{
num_1 = 0.274*8422400*conv([1 7.67],[1 1.7 7225]);
den_1 = conv(conv(conv([1 54.15],[1 0]),conv([1 85],[1 85])),conv([0.54 1],[1 3.2 6400]));
T = tf(num_1, den_1);
rlocus(num_1, den_1)
Tr = feedback(T,1,-1)
poles_1 = roots([0.540000000000000,123.769000000000,12943.1512000000,1037868.30900000,61645968.8700000,1480134489.31200,19207390750.5664,127885009907.200])
step(Tr)

num_2 = 0.274*9285696*conv([1 7.67],[1 1.7 7225]);
den_2 = conv(conv(conv([1 54.15],[1 0]),conv([1 85],[1 85])),conv([0.54 1],[1 0.336 7056]));
T = tf(num_2,den_2);
rlocus(num_2,den_2);
Tr = feedback(T,1,-1)
poles_2 = roots([0.540000000000000,122.222440000000,12947.8657760000,1091874.48532000,67197771.2736000,1630599456.33648,21176148302.4995,140993223422.688])
step(Tr)
%}
%3_F
%{
num = 8422400*conv(conv([1 85],[1 85]),[1 54.15]);
den_a = conv(conv(conv([1 0],[0.54 1]),conv([1 85],[1 85])),conv([1 54.15],[1 1.6 6400]))
den_b = 8422400*0.274*conv([1 7.67],[1 1.7 7255])
den = [den_a(1) den_a(2) den_a(3) den_a(4) den_a(5)+den_b(1) den_a(6)+den_b(2) den_a(7)+den_b(3) den_a(8)+den_b(4)]
step(num,den)

num = 8422400*0.274*conv([1 7.67],[1 1.7 7225]);
den = conv(conv(conv([1 0],[0.54 1]),conv([1 85],[1 85])),conv([1 54.15],[1 1.6 6400]));
T = tf(num,den)
Tr = feedback(T,1,-1)
step(Tr)
%}
%3_H
%{
num = 8422400*[27.653 2519 1416 6051];
den = conv(conv([1 300.55 38736 5.748e6],[1 0]),conv([0.54 1],[1 1.6 6400]));
T = tf(num,den);
Tr = feedback(T,1,-1)
step(Tr);
%}
%{
num = 8422400*[-5.78 -510.3 447.85 6046.4];
den = conv(conv([1 0],[0.54 1]),conv([1 1.6 6400],[1 300.55 38736 1.631e6]))
T = tf(num,den);
Tr = feedback(T,1,-1);
step(Tr)
num = -822400*[1 300.55 38736 1.631e6];
den = [0.54,164.161,24935.2652,1998525.584,90215825.6,1589305280,14210371840,50925199360]
step(num,den)
%}

%%%%%%%%%% homework 4------Mechatronic control %%%%%%%%%
%1
%{
num = 100*1000*[0.072 1];
den = conv(conv([0.011 1],[1 5]),conv([1 0],[1 200]));
T = tf(num,den);
Tr = feedback(T,1,-1);
num_p = 1000;
den_p = conv(conv([1 0],[1 5]),[1 200]);
T_p = tf(num_p,den_p);
%{
bode(T)
hold on
grid
bode(T_p)
%}
step(Tr)
grid
%}
%2
%{
num_p = 1000;
den_p = conv(conv([1 0],[1 5]),[1 200]);
T_p = tf(num_p,den_p);
num = 100*1000*[2.8 1];
den = conv(conv([64.1 1],[1 0]),conv([1 5],[1 200]));
T = tf(num,den);
Tr = feedback(T,1,-1);
%{
bode(T_p);
hold on
grid
bode(T)
%}
step(Tr)
grid
%}
%3
%{
num_p = 1000;
den_p = conv(conv([1 0],[1 5]),[1 200]);
T_p = tf(num_p,den_p);
num = 1000*1000*conv([0.064 1],[0.1 1]);
den = conv(conv(conv([0.0016 1],[0.285 1]),conv([1 0],[1 5])),[1 200]);
T = tf(num,den)
Tr = feedback(T,1,-1);
%}
%{
bode(T_p);
hold on
grid
bode(T)
%}
%{
step(Tr)
grid
conv([1 4.94],[2489 5973 50760 59971])
1.0e+05*[0.0249    0.1827    0.8027    3.1073    2.9626]
conv(conv([1 0],[1 6.73]),[1 41.5 1953.7])
1.0e+04 *[0.0001    0.0048    0.2233    1.3148  0]
%}


%%%%%%%%%% homework 5------Mechatronic control %%%%%%%%%
%2
%{
syms lambda L1 L2 
a = [0 1;-4 0];
b = [L1;L2];
c = [1 0];
a*b*c
%}
%3
%{
A = [0 1 0; -9 -6 1;0 0 0];
Ap=[0 1; -9 -6];
Bp=[0;1];
B = [0;1;0];
C = [6 0 0];
L = acker(A',C',[-5 -5 -5])
K = acker(Ap,Bp,[-4 -4])
%}




