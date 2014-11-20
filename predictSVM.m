
function [ predictions, model ] = predictSVM( train, label, test )

    load(train);
    load(label);
    load(test);
    
    train = eval(train);
    label = eval(label);
    test = eval(test);
    
    train = scaleData(train);
    test = scaleData(test);
    
    tic;
        model = svmtrain(label, train, '-t 1 -b 1 -d 2 -s 0 -q');
        [~, ~, predictions] = svmpredict(ones(size(test, 1), 1), test, model, '-b 1 -q');
        predictions = predictions(:, 2);
    toc;
    
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