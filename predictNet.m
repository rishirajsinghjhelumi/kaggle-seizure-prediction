
function [ predictions, net ] = predictNet( trainData, label, test )

    net = newpr(trainData, label, [100 100 100]);
    net.divideFcn = '';
    net.trainParam.epochs = 2500;
    net = init(net);
    [net, tr] = train(net, trainData, label);
    
    predictions = sim(net, test);
    predictions = predictions.';
    
end

