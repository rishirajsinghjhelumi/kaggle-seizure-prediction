clc;
clear all;
close all;

OUTPUT_FILE = 'submissionSVM5.csv';
filenames = importdata('sampleSubmission.csv');
filenames = filenames.textdata;
filenum = 2;

clip = {};
preictal = {};

for i = 1: 5
    
    folder = sprintf('Dog_%d', i);
    train = sprintf('dog%d_train', i);
    label = sprintf('dog%d_label', i);
    test = sprintf('dog%d_test', i);
    
    predictions = predictSVM(train, label, test);
    
    for j = 1: length(predictions)
        clip{end + 1} = filenames{filenum};
        filenum = filenum + 1;
        preictal{end + 1} = sprintf('%0.17f', predictions(j));
    end
    
end

for i = 1:2
    
    folder = sprintf('Patient_%d', i);
    train = sprintf('patient%d_train', i);
    label = sprintf('patient%d_label', i);
    test = sprintf('patient%d_test', i);
    
    predictions = predictSVM(train, label, test);
    
    for j = 1: length(predictions)
        clip{end + 1} = filenames{filenum};
        filenum = filenum + 1;
        preictal{end + 1} = sprintf('%0.17f', predictions(j));
    end
    
end

clip = clip.';
preictal = preictal.';
writetable( table(clip, preictal), OUTPUT_FILE );

