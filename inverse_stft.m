% Thiet lap cac thong so cho STFT
frameLength = 1024; % Do dai cua cac khung
overlap = 0.75; % So luong mau chong lan giua cac khung
hopLength = round(frameLength * (1 - overlap)); % Khoang cach chuyen doi giua cac khung
 
% Thuc hien STFT
stftOutput = spectrogram(audio, hamming(frameLength), frameLength - hopLength, frameLength);
 
% Thuc hien iSTFT bang phuong phap Overlap-Add de tai tao lai tin hieu
reconstructedAudio = zeros(length(audio), 1);
for i = 1:size(stftOutput, 2)
    startIdx = (i - 1) * hopLength + 1;
    endIdx = startIdx + frameLength - 1;
    reconstructedAudio(startIdx:endIdx) = reconstructedAudio(startIdx:endIdx) + ifft(stftOutput(:, i), frameLength);
end
 
% Tinh toan pho cua am thanh ban dau
N = length(audio); % Do dai cua tin hieu am thanh
frequencies = (0:N-1) * fs / N; % Tao mot mang tan so
audio_spectrum = abs(fft(audio)); % Tinh bien do cua pho
 
% Tinh toan pho cua am thanh da tai tao
reconstructed_spectrum = abs(fft(real(reconstructedAudio)));
 
% Ve do thi pho
figure;
 
subplot(2, 1, 1); % Do thi pho cua am thanh ban dau.
plot(frequencies(1:N/2), audio_spectrum(1:N/2));
title('Pho cua am thanh ban dau');
xlabel('Tan so (Hz)');
ylabel('Bien do');
xlim([0, fs/2]);
 
subplot(2, 1, 2); % Do thi pho cua am thanh da tai tao.
plot(frequencies(1:N/2), reconstructed_spectrum(1:N/2));
title('Pho cua am thanh da tai tao');
xlabel('Tan so (Hz)');
ylabel('Bien do');
xlim([0, fs/2]);
 
sgtitle('So sanh Pho cua am thanh ban dau va da tai tao');
