clc;
close all;
clear all;

for i = 1:5
    
    folder = sprintf('/mnt/OS/Data/ML/Epilepsy/Dog_%d', i);
    train = sprintf('dog%d_train_comb', i);
    label = sprintf('dog%d_label', i);
    test = sprintf('dog%d_test_comb', i);
    
    tic;
        [ train_data, label_data, test_data ] = getFeatureMat(folder);
    toc;
    
    assignin('base', train, train_data);
    assignin('base', label, label_data);
    assignin('base', test, test_data);
    
    save(train, train);
    save(label, label);
    save(test, test);
    
end


for i = 1:2
    
    folder = sprintf('/mnt/OS/Data/ML/Epilepsy/Patient_%d', i);
    train = sprintf('patient%d_train_comb', i);
    label = sprintf('patient%d_label', i);
    test = sprintf('patient%d_test_comb', i);
    
    tic;
        [ train_data, label_data, test_data ] = getFeatureMat(folder);
    toc;
    
    assignin('base', train, train_data);
    assignin('base', label, label_data);
    assignin('base', test, test_data);
    
    save(train, train);
    save(label, label);
    save(test, test);
    
end

