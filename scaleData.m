
function [ scaledData ] = scaleData(data)
    
    dataMean = repmat(mean(data), size(data, 1), 1);
    dataStd = repmat(std(data), size(data, 1), 1);
    
    scaledData = (data - dataMean) ./ dataStd;
    
    dataMax = repmat(max(scaledData), size(data, 1), 1);
    scaledData = scaledData ./ dataMax;
    
end