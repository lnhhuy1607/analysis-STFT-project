fs = 1000;                  % Tan so lay mau (Hz)
t = 0:1/fs:2;                % Vector thoi gian tu 0 den 2 giay
f_mod = 50;                  % Tan so bien do (Hz)
% Tao tinh hinh song sin tan so bien do
x = sin(2*pi*f_mod*t);
% Ve hinh song sin truoc STFT
figure;
subplot(2, 1, 1);
plot(t, x);
title('Hinh Song Sin Truoc STFT');
xlabel('Thoi Gian (s)');
ylabel('Bien do');
% Tinh toan va ve STFT
window_length = 256;
overlap_length = 220;
fft_length = 512;
[s, f, t_stft] = stft(x, fs, 'Window', kaiser(window_length, 5), 'OverlapLength', overlap_length, 'FFTLength', fft_length);
% Chuyen doi magnitudo sang dB
sdb = mag2db(abs(s));
% Ve hinh STFT
subplot(2, 1, 2);
mesh(t_stft, f/1000, sdb);
title('STFT Cua Hinh Song Sin');
xlabel('Thoi Gian (s)');
ylabel('Tan So (kHz)');
zlabel('Magnitude (dB)');
% Dinh dang mau sac cho hinh STFT
cc = max(sdb(:)) + [-60 0];
ax = gca;
ax.CLim = cc;
% Hien thi thanh colorbar
colorbar;
