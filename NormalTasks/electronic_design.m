format short
syms R1
R2 = 10*10^3
R3 = 10*10^3
C = 10*10^-9
W = 2*pi*10^3

e = tan(143/180*pi)*( R1^2*R2^2*W^2*C^2-R2*R3 ) - R1*R2*W*C*(R2+R3);
vpa(simplify(solve(e,R1)),8)

R = 1000:1000:10000;

phi = atan(   R2*W*C*(R2+R3)*R./(R2^2*W^2*C^2*R.^2-R2*R3)  )  /pi*180;
phi_180 = phi + 180;
plot([4500 6500],[150 150])
hold on
plot([4500 6500],[135 135])
hold on
plot(R,phi,R,phi_180)
