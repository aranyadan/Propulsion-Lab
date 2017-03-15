%% Propulsion assignment
clc;
clear;
%% Question 2
Ma = 0.75;
dH = 150;
ts = 0.6:0.2:1.20;
tl = 6./ts;
gamma = 1.4;
pic = 15;
tc = (pic).^0.286;
tr = 1 + ((gamma-1)/2)*Ma*Ma;
tt = 1 - tr*(tc-1)./tl;

% Dimensionless thrust
temp1 = tr*tc.*tt - 1;
temp2 = (2/(gamma-1))*(tl./(tr*tc));

T = (temp1.*temp2).^0.5 - Ma;

% TSFC

temp3 = (tl - tr*tc)./dH;

S = temp3./T;

% plots

subplot(2,1,1);
scatter(ts,T,5,'filled');
hold on; grid on;
plot(ts,T);
title('Variation of Dimensionless thrust with ambient temperature ratio');
xlabel('Ambient Temperature Ratio');
ylabel('Dimensionless Thrust');

subplot(2,1,2);
scatter(ts,S,5,'filled');
hold on; grid on;
plot(ts,S);
title('Variation of TSFC*a0 with ambient temperature ratio');
xlabel('Ambient Temperature Ratio');
ylabel('TSFC * a0');