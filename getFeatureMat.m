
function [ trainFeatures, trainLabels, testFeatures ] = getFeatureMat( folder )

    interictalFiles = {};
    preictalFiles = {};
    testFiles = {};
    
    files = ls(sprintf('%s/', folder));
    files = strsplit(files);
    
    for i= 1: length(files),
        if (strfind(files{i}, 'interictal'))
            interictalFiles{end + 1} = files{i};
        elseif (strfind(files{i}, 'preictal'))
            preictalFiles{end + 1} = files{i};
        elseif (strfind(files{i}, 'test'))
            testFiles{end + 1} = files{i};
        end
    end
    
    interictalFiles = sort(interictalFiles);
    preictalFiles = sort(preictalFiles);
    testFiles = sort(testFiles);
    
    % Get Interictal Features%
    interictalFeatures = [];
    
    for i = 1: length(interictalFiles),
        filename = sprintf('%s/%s', folder, interictalFiles{i});
        data = load(filename);
        data = eval(sprintf('data.interictal_segment_%d.data', i));
        interictalFeatures(i, :) = getFeatures(data);
        
        disp(filename);
    end
    
    % Get Preictal Features%
    preictalFeatures = [];
    
    for i = 1: length(preictalFiles),
        filename = sprintf('%s/%s', folder, preictalFiles{i});
        data = load(filename); 
        data = eval(sprintf('data.preictal_segment_%d.data', i));
        preictalFeatures(i, :) = getFeatures(data);
        
        disp(filename);
    end
    
    % Generate train features and labels %
    trainFeatures = [interictalFeatures; preictalFeatures];
    trainLabels = [zeros(length(interictalFiles), 1);  ones(length(preictalFiles), 1)];
    
    % Get Test Features %
    testFeatures = [];
    
    for i = 1: length(testFiles),
        filename = sprintf('%s/%s', folder, testFiles{i});
        data = load(filename); 
        data = eval(sprintf('data.test_segment_%d.data', i));
        testFeatures(i, :) = getFeatures(data);
        
        disp(filename);
    end

end

