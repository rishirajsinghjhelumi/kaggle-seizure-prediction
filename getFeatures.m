
function [ features ] = getFeatures( data )

      features = getFFTFeatures(data);
    
%     len = size(data, 1);
% 
%     freqCoef = [];
%     timeCoef = [];
% 
%     % Frequency features %
%     dataFFT = log10(abs(fft(data, [], 2)));
%     dataFFT = dataFFT(:, 1:50);
%     
%     fftCoef = reshape(dataFFT.' , 1, numel(dataFFT));
%     
%     fftCorr = corrcoef(dataFFT.');
%     freqEig = sort(eig(fftCorr), 'descend').';
%     
%     for i= 2:len,
%         freqCoef = [freqCoef, fftCorr(i, 1:i-1)];
%     end
%     freqCoef = [freqCoef freqEig];
%     
%     % Time Features %
%     data = data.';
%     
%     timeCorr = corrcoef(data);
%     timeEig = sort(eig(timeCorr), 'descend').';
%     
%     for i= 2:len,
%         timeCoef = [timeCoef, timeCorr(i, 1:i-1)];
%     end
%     timeCoef = [timeCoef timeEig];
%     
%     % Variance Features %
%     variance = var(data);
%     
%     % Overall Features %
%     features = [fftCoef freqCoef timeCoef variance];
end

