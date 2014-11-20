
function [ predictions, model ] = predictRegression( train, label, test )

    load(train);
    load(label);
    load(test);
    
    model = fitensemble(eval(train), eval(label), 'bag', 3000, 'Tree', 'type', 'regression');
    predictions = predict(model, eval(test));

end

