
function [ predictions, net ] = predictNN( trainData, label, test )

    load(trainData);
    load(label);
    load(test);
    
    trainData = eval(trainData).';
    label = eval(label).';
    test = eval(test).';
    
    [ predictions, net ] = predictNet(trainData, label, test);
    
    pre = predictions;
    predictions = [];
    for i=1:10:length(pre)
        m = 0;
        for j = 0: 9
            m = m + pre(i + j);
        end
        predictions(end + 1) = m / 10;
    end
    
end