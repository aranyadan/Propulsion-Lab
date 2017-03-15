%% Propulsion assignment
clc;
clear;
%% Question 3
Ma = 0.75;
dH = 150;
alpha = 4.0;
tl = 5.78;
gamma = 1.4;
pif = 1:0.5:4;
pic = 0:1:30;
nx = size(pif,2);
ny = size(pic,2);
tc = (pic).^0.286;
tf = (pif).^0.286;
tr = 1 + ((gamma-1)/2)*Ma*Ma;
T=zeros(nx,ny);


for i = 1:nx
  tt = 1 - (tr/tl)*(tc - 1 + alpha*(tf(i) - 1));

  % Dimensionless thrust
  temp1 = tr*tc.*tt - 1;
  
  temp2 = (2/(gamma-1))*(tl./(tr*tc));
  
  temp3 = (2/(gamma-1)) * (tr*tf(i) - 1);
  V1na = (temp3).^0.5 - Ma;
  Vna = zeros(1,ny);
  for j = 1:ny
    if(temp1(j)<0)
      T(i,j) = 0;
    else
      Vna(j) = (temp1(j).*temp2(j)).^0.5 - Ma;
      T(i,j) = (Vna(j) + alpha * V1na)./(1+alpha);    
    end
  end
    
    
    % TSFC

    f = (tl - tr.*tc)/dH;

    S(i,:) = f./((1+alpha).*T(i,:));

end

% plots

subplot(2,1,1);
surf(pic,pif,T);
hold on; grid on;
title('Variation of Dimensionless thrust with compressor pressure ratio and fan pressure ratio');
xlabel('Compressor Pressure Ratio');
ylabel('Fan pressure ratio');
zlabel('Dimensionless Thrust');

subplot(2,1,2);
surf(pic,pif,S);
hold on; grid on;
title('Variation of TSFC*a0 with compressor pressure ratio and fan pressure ratio');
xlabel('Compressor Pressure Ratio');
ylabel('Fan pressure ratio');
zlabel('TSFC*a0');