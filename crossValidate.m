
function [ cp ] = crossValidate( trainData, label, k )
    
    load(trainData);
    load(label);
    
    trainData = eval(trainData);
    label = eval(label);

    idx = crossvalind('Kfold', label, k);
    cp = classperf(label);
    
    for i = 1:k
        test = (idx == i);
        train = ~test;
        predictions = predictNet(trainData(train, :).', label(train, :).', trainData(test, :).');
        class = (predictions >= 0.5);
%         sum(class == label(test, :))
        classperf(cp, class, test);
    end

end

