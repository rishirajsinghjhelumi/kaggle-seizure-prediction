
function [ predictions, model ] = predictLR( train, label, test )

    load(train);
    load(label);
    load(test);
    
    tic;
%         model = glmfit(eval(train), eval(label), 'binomial', 'link', 'logit');
%         predictions = glmval(model, eval(test), 'logit');
        
        model = mnrfit(eval(train), eval(label) + 1);
        predictions = mnrval(model, eval(test));
        predictions = predictions(:, 2);
    toc;

end

