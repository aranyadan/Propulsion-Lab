%% Propulsion assignment
clc;
clear;
%% Question 1
Ma = 0.75;
dH = 150;
tl = 6;
gamma = 1.4;
pic = 5:2.5:25;
tc = (pic).^0.286;
tr = 1 + ((gamma-1)/2)*Ma*Ma;
tt = 1 - tr*(tc-1)/tl;

% Dimensionless thrust
temp1 = tr*tc.*tt - 1;
temp2 = (2/(gamma-1))*(tl./(tr*tc));

T = (temp1.*temp2).^0.5 - Ma;

% TSFC

temp3 = (tl - tr.*tc)/dH;

S = temp3./T;

% plots

subplot(2,1,1);
scatter(pic,T,5,'filled');
hold on; grid on;
plot(pic,T);
title('Variation of Dimensionless thrust with compressor pressure ratio');
xlabel('Compressor Pressure Ratio');
ylabel('Dimensionless Thrust');

subplot(2,1,2);
scatter(pic,S,5,'filled');
hold on; grid on;
plot(pic,S);
title('Variation of TSFC*a0 with compressor pressure ratio');
xlabel('Compressor Pressure Ratio');
ylabel('TSFC * a0');