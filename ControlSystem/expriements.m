%%%%%%%%%%%%%%%
% Sensor 1 %%%%
%%%%%%%%%%%%%%%
%{
x1 = [20 40 60 80 100];
v1 = [1 1.8 3.3 4.2 5.3];
l1 = polyfit(x1,v1,1);
x2 = [20 40 60 80 100];
v2 = [1.5 3.1 4.4 6 7.3];
l2 = polyfit(x2,v2,1);
x3 = [20 40 60 80 100];
v3 = [5.2 10.8 15.2 19.6 25.3];
l3 = polyfit(x3,v3,1);
plot(x1,polyval(l1,x1),x2,polyval(l2,x2),x3,polyval(l3,x3));
title('??????????????????X-V????');
xlabel('????????');
ylabel('????');
legend('????','????','????');
hold on;
plot(x1,v1,'ro',x2,v2,'ro',x3,v3,'ro');
%}

%%%%%%%%%%%%%%%
% Sensor 2 %%%%
%%%%%%%%%%%%%%%
%{
Rw1 = 10000;
w = 1000*2*pi;

C1 = 6800e-12;
C2 = 0.022e-6;
R2 = 10000;
R3 = 10000;
R4 = 10000;
Uin = 1;
U3 = Uin*R2/(1/(w*C1*1i)+R2);
U2 = U3;
U1 = 2*U2-Uin; % U2*(Rw1+1/(w*C2*1i))/(R3+Rw1+1/(w*C2*1i)) 
U5 = U1*Rw1/(Rw1+1/(w*C2*1i)); % U2*(1/(w*C2*1i))/(R3+Rw1+1/(w*C2*1i))
U6 = U5;
Uo = 2*U6-U1
abs(Uo)
phi = 180*angle(Uo)/pi
phi+180
%}

%%%%%%%%%%%%%%%
% Sensor 3 %%%%
%%%%%%%%%%%%%%%
%{
Vipp = [0.5 1 2 4 8 16];
Vo = [0.405 0.828 1.578 3.33 6.82 13.38];
Vo2 = [0.207 0.31 0.49 0.91 1.55 3.01];
plot(Vipp,Vo2);
title('Vip-p---Vo????');
xlabel('Vip-p(V)');
ylabel('Vo(V)');
%}

%%%%%%%%%%%%%%%
% Sensor 5 %%%%
%%%%%%%%%%%%%%%
%{
f = [3 4 5 6 7 8 10 12 20 25];
vpp = [0.408 0.472 0.600 1.12 4.04 0.804 0.320 0.240 0.160 0.160]
plot(f,vpp)
xlabel('f(Hz)');
ylabel('Vp-p(V)');
title('????????????????????????????');
vopp = [1 2 3 4 5 6 7 8 9];
vp_p = [0.40 0.80 1.2 2.0 3.4 4.4 5.0 6.2 6.8];
plot(vopp,vp_p);
title('????---Vp-p ????');
xlabel('Vopp(V)');
ylabel('Vp-p(V)');
%}

%%%%%%%%%%%%%%%
% Sensor 6 %%%%
%%%%%%%%%%%%%%%
%{
tri = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data6/1v10hz_sanjiao_t.xlsx');
rec = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data6/1v10hz_fangbo_t.xlsx');
sin = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data6/1v10hz_sin_t.xlsx');
asig = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data6/1v10hz_a_time.xlsx');
tri_t = tri(:,1);
tri_y = tri(:,2);
rec_t = rec(:,1);
rec_y = rec(:,2);
sin_t = sin(:,1);
sin_y = sin(:,2);
asig_t = asig(:,1);
asig_y = asig(:,2);

fs = 5120;
subplot(2,2,1);
plot(tri_t,tri_y);
title('??????????????');
xlabel('Time')
ylabel('Signal')
n = length(tri_t);
y = fft(tri_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    % power of the DFT
subplot(2,2,3);
plot(f,power)
set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('??????????????');
xlabel('Frequency')
ylabel('Power')
axis([0 200 0 1000]);

subplot(2,2,2);
plot(rec_t,rec_y);
title('????????????');
xlabel('Time')
ylabel('Signal')
n = length(rec_t);
y = fft(rec_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    % power of the DFT
subplot(2,2,4);
plot(f,power)
set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('????????????');
xlabel('Frequency');
ylabel('Power');
axis([0 200 0 1800]);

subplot(2,2,2);
plot(sin_t,sin_y);
title('??????????????');
xlabel('Time')
ylabel('Signal')
n = length(sin_t);
y = fft(sin_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    % power of the DFT
subplot(2,2,4);
plot(f,power)
set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('??????????????');
xlabel('Frequency');
ylabel('Power');
axis([0 200 0 1800]);

subplot(2,2,2);
plot(asig_t,asig_y);
title('??????????????');
xlabel('Time')
ylabel('Signal')
n = length(asig_t);
y = fft(asig_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    % power of the DFT
subplot(2,2,4);
plot(f,power)
set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('????????????????');
xlabel('Frequency');
ylabel('Power');
axis([0 200 0 60]);
%}

%%%%%%%%%%%%%%%
% Sensor 7 %%%%
%%%%%%%%%%%%%%%
%{
sin = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data7/sin_t.xls');
ran = xlsread('/Users/treasersmac/ZJU-ALL/_6_grand3_2/Sensor/Sensor expirements/data7/random_t.xls');

sin_t = sin(:,1);
sin_y = sin(:,2);
ran_t = ran(:,1);
ran_y = ran(:,2);
fs = 24000;
subplot(2,1,1);
plot(sin_t,sin_y);
title('??????????????');
xlabel('Time')
ylabel('Signal')
n = length(sin_t);
y = fft(sin_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    
subplot(2,1,2);
plot(f,power)
%set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('????????????????');
xlabel('Frequency');
ylabel('Power');
axis([0 100 0 10000]);


fs = 5120;
subplot(2,1,1);
plot(ran_t,ran_y);
title('????????????');
xlabel('Time')
ylabel('Signal')
n = length(ran_t);
y = fft(ran_y,n);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    
subplot(2,1,2);
plot(f,power);
%set(gca,'xtick',[10 30 50 70 90 110 130 150 170],'xticklabel',[10 30 50 70 90 110 130 150 170])
title('????????????????');
xlabel('Frequency');
ylabel('Power');
axis([0 5120 0 500]);
%}

%%%%%%%%%%%%%
% Motor 2 %%%
%%%%%%%%%%%%%
%{
n1 = [1400 1200 1000 900 800 700 600 400 200];
T1 = [0.25 0.44 0.45 0.43 0.42 0.40 0.39 0.38 0.40];
T2 = [0.25 0.43 0.43 0.45 0.42 0.41 0.39 0.38 0.40];
S1 = (1500-n1)/1500;
plot(T1,S1,T2,S1);
title('??????????????M-S????');
xlabel('????T');
ylabel('??????S');
hold on
plot([0 0.5],[0.3 0.3]);
axis([0 0.5 0 1]);
set(gca,'ydir','reverse') %y??????????????
%}
%{
n3 = [1400 1200 1000 800 700 600 500 200 100];
T3 = [0.41 1.09 1.38 1.46 1.47 1.53 1.45 1.41 1.40];
n4 = [1400 1200 1000 800 700 600 400 200 100];
T4 = [0.30 0.86 1.18 1.37 1.42 1.45 1.55 1.53 1.48];
n5 = [1400 1200 1000 800 700 600 300 200 100];
T5 = [0.20 0.63 0.96 1.17 1.25 1.32 1.51 1.30 1.48];

S3 = (1500-n3)/1500;
S4 = (1500-n4)/1500;
S5 = (1500-n5)/1500;

plot(T3,S3,T4,S4,T5,S5)
title('??????????????M-S????');
xlabel('????T');
ylabel('??????S');
legend('??????????0??','??????????2??','??????????5??');
hold on
plot([0 2],[0.5 0.5]);
plot([0 2],[0.75 0.75]);
plot([0 2],[0.8 0.8]);
axis([0 2 0 1]);
set(gca,'ydir','reverse') %y??????????????
%}

%%%%%%%%%%%%%
% Motor 3 %%%
%%%%%%%%%%%%%
%{
I1 = [0.311 0.241 0.175 0.149 0.126 0.119 0.139 0.170 0.235 0.307];
If1 = [1.32 1.26 1.12 1.01 0.96 0.83 0.72 0.61 0.51 0.39];
I2 = [0.362 0.253 0.273 0.227 0.226 0.194 0.210 0.224 0.247 0.289];
If2 = [1.27 1.21 1.14 1.04 0.99 0.95 0.85 0.74 0.65 0.55];
plot(If1,I1,If2,I2)
title('????????V??????');
xlabel('????????If');
ylabel('????????I');
axis([0 1.4 0.12 0.4])
legend('P2=0','P2=0.5??????????');
%}
%{
P2 = [91.35 77.175 63 47.25 23.625 ];%47.25
I = [0.276 0.243 0.205 0.165 0.088 ];%0.079
P = [102.1 89.35 74.6 59.15 36.7 ];%22.94
cosphi =[0.99 0.98 0.97 0.95 0.82 ];%0.77
T2 = [0.58 0.49 0.4 0.3 0.15 ];%0.3
yita = [0.895 0.864 0.845 0.799 0.644 ];%2.0

%subplot(2,3,1);
%plot(P2,I);
%title('I-P2????');

%subplot(2,3,2);
%plot(P2,P);
%title('P-P2????');
%ylabel('????????P');
%subplot(2,3,3);
%plot(P2,cosphi);
%title('cos??-P2????');
%ylabel('??????????');
%subplot(2,3,4);
%plot(P2,T2);
%title('T2-P2????');
%ylabel('????????T2');
%subplot(2,3,5);
plot(P2,yita);
title('??-P2????');
ylabel('??????');
xlabel('????????P2');
%}


%%%%%%%%%%%%%
% Motor 4 %%%
%%%%%%%%%%%%%
%{
Ia = [1.102 0.935 0.86 0.693 0.543 0.388 0.242 0.088];

n = [1598 1612 1622 1640 1658 1681 1707 1739];
T2 = [1.39 1.15 1.05 0.85 0.65 0.46 0.28 0.08];
yita = [95.94 94.38 94.26 95.75 94.47 94.86 94.01 75.25];

plot(T2,n);
title('n-T2????');
xlabel('T2/Nm')
ylabel('n/r/min')
axis([0 1.50 0 2000])

U = [220 200 160 130 110 90 67 50];
n1 = [1610 1522 1187 940 760 565 105 85];
n2 = [1413 1500 1590 1680 1770 1860 1950 2080];
If = [0.128 0.1 0.083 0.072 0.06 0.058 0.052 0.041];

plot(U,n1);
title('n-U????');
xlabel('U/V')
ylabel('n/r/min')
axis([40 230 0 2000])
%}

%%%%%%%%%%%%%
% Motor 5 %%%
%%%%%%%%%%%%%
%{
n = [2701 2558 2430 2267 1783 1258 590] ;  %(r/min)
Uc = [220 180 160 140 100.8 71.00 40.87]; % v
plot(Uc,n);
title('????????????????????????');
xlabel('Uc/V');
ylabel('n/(r/min)');
axis([0 250 0 3000])
n = [1481 1299 1011 759 555 324 140];
Uc = [84.60 74.80 61.90 50.10 41.30 30.59 20.00];
plot(Uc,n);
title('????????-????????????????????');
xlabel('Uc/V');
ylabel('n/(r/min)');
axis([0 100 0 1500])
%}

%%%%%%%%%%%%%
% Motor 6 %%%
%%%%%%%%%%%%%
%{
T_220 = [1.36 1.1 0.9 0.7 0.5 0.3 0.1];
n_220 = [1600 1622 1643 1663 1686 1713 1740];
T_110 = [1.35 1.1 0.9 0.7 0.5 0.3 0.1];
n_110 = [737 765 786 806 826 849 875];
plot(T_220,n_220,T_110,n_110);
title('????????????????????????');
xlabel('????T');
ylabel('????n');
legend('Ua=UN=220V','Ua=0.5UN=110V');
%}
%{
n_08 = [1647 1406 1160 912 639 516 96];
u_08 = [220 190 160 130 100 90 64];
n_0 = [1704 1478 1242 1012 784 555 321];
u_0 = [220 190 160 130 100 70 40];
plot(u_08,n_08,u_0,n_0);
axis([0 220 0 1800])
title('????????????????????????');
xlabel('????????Ua');
ylabel('????n');
legend('T=0.8Nm','T=0Nm');
T_220 = [1.36 1.1 0.9 0.7 0.5 0.3 0.1];
n_220 = [1600 1622 1643 1663 1686 1713 1740];
T_110 = [1.35 1.1 0.9 0.7 0.5 0.3 0.1];
n_110 = [737 765 786 806 826 849 875];
plot(T_220,n_220,T_110,n_110);
% axis([0 220 0 1800])
title('????????????????????????');
xlabel('????T');
ylabel('????n');
legend('Ua=220V','Ua=110V');

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechatronic Control -2 %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
M = 1.096;  % Kg
m = 0.109;  % Kg
b = 0.1;    % N/m/sec
l = 0.25;   % m
I = 0.0034; % Kg.m2
g = 9.8;    %m/s^2

(-(I+m*l^2)*b)/(I*(M+m)+M*m*l^2 )
(m^2*g*l^2)/(I*(M+m)+M*m*l^2 )
(-m*l*b)/(I*(M+m)+M*m*l^2 )
(m*g*l*(M+m))/(I*(M+m)+M*m*l^2 )
disp('====')
(I+m*l^2)/(I*(M+m)+M*m*l^2 )
m*l/(I*(M+m)+M*m*l^2 )

ml = m*l
a = (M+m)*(I+(m*l)^2 )-m^2*l^2
b = (I+m*l^2)*b
c = -(M+m)*m*g*l
d = -b*m*g*l


A = [0 1 0 0;
     0 -0.0883 0 0;
     0 0 0 1;
     0 -0.2357 27.8285 0];
B = [0 0.8832 0 2.3566]';
C = [0 0 1 0];
Controlable = [B A*B A^2*B A^3*B];
rank(Controlable);
Observable = [C; C*A; C*A^2; C*A^2];
rank(Observable);

num = [0.0272 0];
den = [0.0042 0.0010 -0.3218 -2.7272e-04];
[z, p] = tf2zp(num,den)
%nyquist(num,den)


sd1_value = sd1.signals.values;
time = 1:347;
plot(time,sd1_value)
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechatronic Control -5 %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% old controller
%{
num0 = 0.02725;
den0 = [0.0102125 0 -0.26705];
num = 2208*[1 3.88]
den = conv([1 56],[1 0 -26.15]);
T = tf(num,den)
Tr = feedback(T,1,-1)
bode(Tr)
[Gm,Pm,Wgm,Wpm] = margin(Tr)
%}
% new controller
%{
num = 2.668*[1366 19030 133267];
den = conv([1 106 0],[1 0 -26.15])
T = tf(num,den)
Tr = feedback(T,1,-1)
step(Tr)
%}
%e
%{
pos = ScopeData2.signals(1).values;  %ScopeData3.signals(1).values
angle= ScopeData2.signals(2).values-2*pi;  %ScopeData3.signals(2).values
time = ScopeData2.time; %ScopeData3.time
subplot(2,1,1);
plot(time,pos);
title('Position-Time')
xlabel('Time/s')
ylabel('Position/m')
hold on 
subplot(2,1,2);
plot(time,angle);
title('Angle-Time')
xlabel('Time/s')
ylabel('Angle/degree')
%}
%{
num = 2.668*297.43*conv([1 1],[1 8.29]);
den = conv(conv([1 10e-5],[1 56]),[1 0 -26.15]);
T = tf(num,den);
Tr = feedback(T,1,-1);
step(Tr)
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechatronic Control -6 %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
A = [0 1 0 0;
     0 0 0 0;
     0 0 0 1;
     0 0 29.4 0];
B = [0; 1; 0; 3];

rank([B A*B A^2*B A^3*B])
syms k1 k2 k3 k4 v
K = [k1 k2 k3 k4]
I = eye(4)
(A-B*K)
det(v*I-(A-B*K))

k = [-122.45 -46.94 170.95 26.98];%-9.52
A = A-B*k
C = [1 0 0 0;0 0 1 0];
D = [0;0];
% A_ = [0 1 0 0;0.136 0.295 -14.33 -2.32;0 0 0 1;0.408 0.885 -13.6 -6.96];
T = ss(A,B,C,D);
step(T)
%}
%Pole place via ackerman
A = [0 1 0 0;
     0 0 0 0;
     0 0 0 1;
     0 0 29.4 0];
B = [0; 1; 0; 3];
P = [-1.3+2.25i -1.3-2.25i -8 -8];
K = acker(A,B,P)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechatronic Control -7 %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1
%{
num_p = 2.67;
den_p = [1 0 -26.15];
num = 2.67*(97.94)*[0.062 1];
den = conv([1 0 -26.15],[0.00445 1]);
T = tf(num,den)
bode(T)
grid
%}
%2
%{
num = 10*conv([0.062 1],[0.165 1]);
den = conv(conv([0.00445 1],[0.1906 1]),[1 0 -26.15])
T = tf(num,den)
bode(T)
grid
%}
%e
%{
pos = leadlag_ls.signals(1).values; 
angle= leadlag_ls.signals(2).values;  
time = leadlag_ls.time; 
subplot(2,1,1);
plot(time,pos);
title('Position-Time')
xlabel('Time/s')
ylabel('Position/m')
hold on 
subplot(2,1,2);
plot(time,angle);
title('Angle-Time')
xlabel('Time/s')
ylabel('Angle/degree')
%}
