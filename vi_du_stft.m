% Tin hieu mau
Fs = 1000; % Tan so lay mau
t = 0:1/Fs:1; % Vector thoi gian
f1 = 50; % Tan so cua tin hieu
f2 = 150;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Tong cua hai song sine
 
% Tham so STFT
kich_thuoc_cua_so = 128;
buoc_nhay = 64;
 
% Thuc hien STFT
[S, f, t] = spectrogram(x, hamming(kich_thuoc_cua_so), kich_thuoc_cua_so - buoc_nhay, kich_thuoc_cua_so, Fs);
 
% Ve bieu do pho
figure;
surf(t, f, 10*log10(abs(S)), 'EdgeColor', 'none');
axis xy; axis tight; colormap(jet); view(0,90);
xlabel('Thoi gian (s)');
ylabel('Tan so (Hz)');
title('Spectrogram su dung STFT');
colorbar;
 
