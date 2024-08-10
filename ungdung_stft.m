% Doan code da thuc hien truoc khi loc tieng on
[x, fs] = audioread('piano.wav'); 
x = x(:, 1); % Lay mot kenh neu co nhieu kenh
 
% Cai dat cac thong so cho STFT
frameLength = 1024; % Do dai cua cac khung
overlap = 0.75; % Ty le chong lan giua cac khung
hopLength = round(frameLength * (1 - overlap)); % Khoang cach di chuyen giua cac khung
 
% Thuc hien STFT truoc khi loc tieng on
stftOutput_before = spectrogram(x, hamming(frameLength), frameLength - hopLength, frameLength);
 
% Tao do thi cho pho tan so truoc khi loc tieng on
figure;
subplot(2, 1, 1);
imagesc(log10(abs(stftOutput_before)));
title('Pho tan so truoc khi loc tieng on');
colorbar;
 
% Loc tieng on bang cach loai bo cac thanh phan tan so tuong ung
% (Ma loc tieng on da duoc thuc hien o doan code truoc)
% Tan so cat can loai bo (vi du: 2000 Hz)
cutOffFrequency = 2000;
 
% Chuyen doi tan so cat tu Hz sang chi so cua mang tan so tuong ung trong ket qua STFT
freq_bins_to_remove = round(cutOffFrequency / (fs / frameLength));
 
% Thuc hien STFT sau khi loc tieng on
stftOutput_after = stftOutput_before;
stftOutput_after(freq_bins_to_remove:end, :) = 0; % Loai bo cac thanh phan tan so tu freq_bins_to_remove tro di
 
% Tao do thi cho pho tan so sau khi loc tieng on
subplot(2, 1, 2);
imagesc(log10(abs(stftOutput_after)));
title('Pho tan so sau khi loc tieng on');
colorbar;
