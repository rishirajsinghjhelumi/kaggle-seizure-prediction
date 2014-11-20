
function [ features ] = getFFTFeatures( data )

    len = size(data, 1);
    len2nd = size(data, 2);
    
    samples = 48;
    part = 0.06;
    
    dataFFT = abs(fft(data, [], 2));
    dataFFT = dataFFT(:, 1: round(part * len2nd));
    
    lenFFT = length(dataFFT);
    num = round(lenFFT / samples);
    
    features = [];
    for j = 1:len,
        dataMean = zeros(1, samples);
        for i = 1:samples - 1,
            dataMean(i) = mean(dataFFT(j, 1 + num * (i - 1): num * i ).');
        end
        i = i + 1;
        dataMean(i) = mean(dataFFT(j, 1 + num * (i - 1): end ).');
        features = [features dataMean];
    end

end

