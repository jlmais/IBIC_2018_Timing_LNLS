clear all; close all; clc;

z = tf('z');

% RF frequency in Hz
RF = 500e6;
% reference clock frequency
fref = RF*5/36;
% dmtd parameter and frequency
N = 144;
fdmtd = fref*N./(N+1);

% Miminum time difference detectable by dmtd
tmin = 1./(fref*N);

% sample frequency and sample time of the dmtd
fbeat = fref./(N+1);
Ts = 1/fbeat;

% dmtd phase gain
Kdmtd = N/(2*pi);

% from FPGA code
phase_avg = 7;
phase_div = 1;

% Moving Average Filter (maf)
m = phase_avg; 
d = 2^phase_div;
num = zeros(1, m+1);
num(1) = 1;
num(m+1) = -1;
den = zeros(1, m+1);
den(2) = -1;
den(1) = 1;
MAF = tf(num, d*den, Ts);

% PI controler
Kp = 10;
Kvco = 3.3/65536*135/1e6*fref*2*pi;

H = feedback(Kdmtd*MAF*Kp*Kvco*z/(z-1), 1)

abs(pole(H))
 

