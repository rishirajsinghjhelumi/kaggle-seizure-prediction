
function [ predictions, model ] = predictTreeBagger( train, label, test )

    load(train);
    load(label);
    load(test);
    
    options = statset('UseParallel',true);
    model = TreeBagger(3000, eval(train), eval(label), 'oobpred', 'on'); %'Options', options);
    [~, predictions] = model.predict(eval(test));
    predictions = predictions(:, 2);
    
end

