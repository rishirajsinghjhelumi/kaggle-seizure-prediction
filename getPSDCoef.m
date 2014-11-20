
function [ psdCoef ] = getPSDCoef( data )

    len = size(data, 1);
    psdMat = [];
    psdCoef = [];
    
    for i = 1: len,
        dataFFT = fft(data(i, :), [], 2);
        psdMat = [psdMat; pwelch(dataFFT).'];
    end
    
    psdCorr = corrcoef(psdMat.');
%     psdEig = sort(eig(psdCorr), 'descend').';
    
    for i= 2:len,
        psdCoef = [psdCoef, psdCorr(i, 1:i-1)];
    end
    
end
