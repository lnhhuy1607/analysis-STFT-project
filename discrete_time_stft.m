[audio, Fs] = audioread('sax-phrase.wav');
windowLength = 1024; % Do dai cua so
overlap = windowLength / 2; % Do chong lan
nfft = 2048; % So diem trong bien doi Fourier
[S, f, t] = spectrogram(audio, windowLength, overlap, nfft, Fs);
 
phase = angle(S); % Tinh toan pha tu du lieu STFT
 
% Chuan bi du lieu cho bieu do time domain
time = (0:length(audio) - 1) / Fs; % Tao vecto thoi gian tuong ung voi tin hieu audio
 
% Giam so luong mau cua tin hieu audio de hien thi tren bieu do
downsampleFactor = 10; % Yeu to giam mau
audio_downsampled = audio(1:downsampleFactor:end); % Lay mau can hien thi
 
% Tao vecto thoi gian moi tuong ung voi tin hieu audio sau giam mau
time_downsampled = (0:length(audio_downsampled) - 1) / Fs * downsampleFactor; 
 
% Tao figure moi
figure;
 
% Bieu do time domain
subplot(3, 1, 1);
plot(time_downsampled, audio_downsampled);
xlabel('Thoi gian (s)');
ylabel('Amplitude');
title('Bieu do thoi gian cua tin hieu am thanh sax-phrase.wav (giam mau)');
 
% Bieu do pho
subplot(3, 1, 2);
surf(t, f, 10*log10(abs(S)), 'edgecolor', 'none');
axis tight;
view(0, 90);
xlabel('Thoi gian (s)');
ylabel('Tan so (Hz)');
title('Pho cua tin hieu am thanh sax-phrase.wav');
colorbar;
 
% Bieu do pha
subplot(3, 1, 3);
surf(t, f, phase, 'edgecolor', 'none');
axis tight;
view(0, 90);
xlabel('Thoi gian (s)');
ylabel('Tan so (Hz)');
title('Pha cua tin hieu am thanh sax-phrase.wav');
colorbar;
