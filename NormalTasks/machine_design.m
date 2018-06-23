%机械设计课程设计减速器设计，2018，春。
%楼嵩，3150102681
format long g
%四、轴
%(一)高速轴计算

%(二)中速轴计算
n2 = 309.68; % r/min
T2 = 94880; % N?mm
P2 = 3.08; % kW
z2 = 69; mn = 2; % mm
d2 = 145.6; % mm
b2 = 42; % mm
beta_2 = [18 34 24]; % 18°34‘24’‘
beta2 = deg2rad(dms2degrees(beta_2)); %转化为弧度
z3 = 31;
d3 = 65.55; % mm
b3 = 64; % mm
beta_3 = [18 57 12]; % 18°57'12''
beta3 = deg2rad(dms2degrees(beta_3)); %转化为弧度
% (1)最小直径
C = 118;
d_min_2 = C*(P2/n2)^(1/3)
% (4)齿轮受力
Ft2 = 1303;Fr2 = 500;Fa2 = 438;
Ft3 = 2895;Fr3 = 1114;Fa3 = 994;
% (5)轴承反力
RH3 = 372;
RH4 = 986;
RV3 = 1980;
RV4 = 2218;
% (6)弯矩计算
M2H_ = 43*RH3
M2H__ = M2H_ - Fa2*d2/2
M3H__ = -57*RH4
M3H_ = M3H__ + Fa3*d3/2
M2V = 43*RV3
M3V = 57*RV4
M2_ = (M2H_^2+M2V^2)^0.5
M2__ = (M2H__^2+M2V^2)^0.5
M3_ = (M3H_^2+M3V^2)^0.5
M3__ = (M3H__^2+M3V^2)^0.5
% (7)扭矩,等效弯矩
alpha = 0.58;
M2e_ = M2_
M2e__ = (M2__^2+(alpha*T2)^2)^0.5
M3e_ = ((alpha*T2)^2+M3_^2)^0.5
M3e__ = M3__
% (8)计算齿轮2、3处截面轴直径
sigma_1_ = 60; % Mpa
d_2_ = (M2e__/(0.1*sigma_1_))^(1/3)
d_3_ = (M3e_/(0.1*sigma_1_))^(1/3)
d_2 = 45
d_3 = 45
% (9)校核疲劳强度
sigma_a = 32*M3__/(pi*d_3^3)
sigma_m = 0
tor_a = 8*T2/(pi*d_3^3)
tor_m = tor_a

sigma_1 = 275;
tor_1 = 155;
fai_sigma = 0.2;
fai_tor = 0.1;
K_sigma = 1.82;
K_tor = 1.62;
epsi_sigma = 0.81;
epsi_tor = 0.76;
beta = 0.9;
KN = 1;
S_ = 1.5;

S_sigma = KN*sigma_1/(K_sigma*sigma_a/(beta*epsi_sigma)+fai_sigma*sigma_m)
S_tor = KN*tor_1/(K_tor*tor_a/(beta*epsi_tor)+fai_tor*tor_m)
S = S_sigma*S_tor/(S_sigma^2+S_tor^2)^0.5


%(三)低速轴计算
n3 = 76.39; % r/min
T3 = 370310; % N?mm
P3 = 2.96; % kW
z4 = 126; mn = 2; % mm
d4 = 266.45; % mm
b4 = 59; % mm
beta_4 = [18 57 12]; % 18°34‘24’‘
beta4 = deg2rad(dms2degrees(beta_2)); %转化为弧度
% (1)最小直径
C = 118;
d_min_3 = C*(P3/n3)^(1/3)
% (4)齿轮受力
Ft4 = 2*T3/d4
Fr4 = Ft4*tan(20/180*pi)/cos(beta4)
Fa4 = Ft4*tan(beta4)
% (5)轴承反力
RH5 = (Fa4*d4/2+Fr4*57)/161
RH6 = RH5-Fr4
RV5 = Ft4*57/161
RV6 = Ft4-RV5
% (6)弯矩计算
M4H_ = 104*RH5
M4H__ = M4H_ - Fa4*d4/2
M4V = -104*RV5
M4_ = (M4H_^2+M4V^2)^0.5
M4__ = (M4H__^2+M4V^2)^0.5
% (7)扭矩,等效弯矩
alpha = 0.58;
alpha_tor = alpha*T3
M4e_ = M4_
M4e__ = ((alpha*T3)^2+M4__^2)^0.5

% (8)计算齿轮4、联轴器处截面轴直径
sigma_1_ = 60; % Mpa
d_4_ = (M4e__/(0.1*sigma_1_))^(1/3)
d_c_ = (alpha*T3/(0.1*sigma_1_))^(1/3)
d_4 = 58; % 实际取的齿轮4处直径
d_c = 43;% 实际取的联轴器处直径
% (9)校核疲劳强度,注意：变量会相互覆盖
sigma_a_3 = 32*M4_/(pi*d_4^3)%取M4_、 M4__大者
sigma_m_3 = 0
tor_a_3 = 8*T3/(pi*d_4^3)
tor_m_3 = tor_a_3

sigma_1 = 275; %sigma -1  
tor_1 = 155; % tor -1 
fai_sigma = 0.2;
fai_tor = 0.1;
K_sigma = 1.82;
K_tor = 1.62;
epsi_sigma = 0.75; %与之前不同
epsi_tor = 0.73; % 与之前不同
beta = 0.9;
KN = 1;
S_ = 1.5;

S_sigma = KN*sigma_1/(K_sigma*sigma_a/(beta*epsi_sigma)+fai_sigma*sigma_m)
S_tor = KN*tor_1/(K_tor*tor_a/(beta*epsi_tor)+fai_tor*tor_m)
S = S_sigma*S_tor/(S_sigma^2+S_tor^2)^0.5


