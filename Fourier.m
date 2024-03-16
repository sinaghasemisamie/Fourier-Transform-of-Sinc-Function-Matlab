%%% Fourier 
%% Basic Structures
clear 
close all
clc
%% Define Desired Signal
mx = 10; % Start/End Point
Fs = 1e3; % Sampling Frequency
st = 1./Fs; % Step Width
t = -mx:st:mx; % 
L = length(t); % Length of Time Vector
s = sinc(t); % Sinc Signal
%% Define Fourie Transform
S = fft(s); % FFT of Sinc Signal
S1 = abs(S./L);
S2 = S1(1:L/2+1); % Fourier Transform
f = Fs.*(0:L/2)./L; % Define Frequency
vi = ceil(length(f)./50); % Regulator 
%% Plot
subplot(2,1,1)
plot(t,s,'LineWidth',2,'Color','Blue')
title('Sinc Signal','FontName','Times New Roman','FontWeight','bold')
xlabel('Time Domain (Sec)','FontName','Times New Roman','FontWeight','bold')
ylabel('Amplitude','FontName','Times New Roman','FontWeight','bold')
grid on
subplot(2,1,2)
plot(f,S2,'LineWidth',2,'Color','Blue')
hold on
plot(-f,S2,'LineWidth',2,'Color','Red')
title('Fast Fourier Transform','FontName','Times New Roman','FontWeight','bold')
xlabel('Frequency Domain (Hz)','FontName','Times New Roman','FontWeight','bold')
ylabel('Amplitude','FontName','Times New Roman','FontWeight','bold')
grid on
xlim([-f(vi) f(vi)])
