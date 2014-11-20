
dogRods = [16 16 16 16 15];
for i = 1: 5
    
    train = sprintf('dog%d_train_comb', i);
    test = sprintf('dog%d_test_comb', i);
    
    trainCorr = sprintf('dog%d_train_corr', i);
    testCorr = sprintf('dog%d_test_corr', i);
    
    load(train);
    load(test);
    
    train_data = eval(train);
    test_data = eval(test);
    
    assignin('base', trainCorr, train_data(: , dogRods(i) * 50 + 1 :end) );
    assignin('base', testCorr, test_data(: , dogRods(i) * 50 + 1 :end) );
    
    save(trainCorr, trainCorr);
    save(testCorr, testCorr);
    
end

patientRods = [15 24];
for i = 1:2
    
    train = sprintf('patient%d_train_comb', i);
    test = sprintf('patient%d_test_comb', i);
    
    trainCorr = sprintf('patient%d_train_corr', i);
    testCorr = sprintf('patient%d_test_corr', i);
    
    load(train);
    load(test);
    
    train_data = eval(train);
    test_data = eval(test);
    
    assignin('base', trainCorr, train_data(: , patientRods(i) * 50 + 1 :end) );
    assignin('base', testCorr, test_data(: , patientRods(i) * 50 + 1 :end) );
    
    save(trainCorr, trainCorr);
    save(testCorr, testCorr);
    
end

