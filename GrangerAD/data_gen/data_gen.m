function [series] = data_gen(features,lag,dependencies1,dependencies2,n1, n2)

% features = 3
% lag = 2
% dependencies = 2

% allocate space for time series
series = zeros(features, n1+n2);

% find nonzero values in dependencies matrix C1
[rowIdx, colIdx] = find(dependencies1~=0);
% find nonzero values in dependencies matrix C2
[rowIdx2, colIdx2] = find(dependencies2~=0);
% find which variables/features have dependencies
deps = unique(rowIdx);
deps_len = length(deps);
deps2 = unique(rowIdx2);
deps_len2 = length(deps2);
% find how many dependencies each row has
deps_per = sum(dependencies1,2);
deps_per2 = sum(dependencies2,2);

% set min/max values for coefficients -> strength of
% dependencies
coeff_min = 0.1;
coeff_max = 0.9;

%coefficients = cell(features);

%rnd_coeff = round(coeff_min+rand*(coeff_max-coeff_min),1);

% generate time series that don't have any dependencies
for i = 1:features
    if ~ismember(i,deps)
        series(i,:) = normrnd(rand, rand, [1,n1+n2]);
    end
    
end

% generate rest of the time series according to
% dependency matrix
for i = 1:deps_len
    mu = rand;
    sigma = rand;
    % gernerate random coefficient matrix depending on
    % how many dependencies a feature has (eg 3 deps -> 3x3 coeff mat)
    % rounding to one decimal in range coeff_min to coeff_max
    coeffs = round(coeff_min+rand(deps_per(i)*lag,1)*(coeff_max-coeff_min),1)
    % generate every value from 1 to n
    for j = 1:n1
        if j < lag+1
           series(i,j) = normrnd(mu, sigma);
        else
            % generates lagged values by multiplying dependency matrix
            % with the time series at t-lag:t to get correct values
            lagged_vals = nonzeros(dependencies1(deps(i),:).*series(:,j-lag:j-1)');
            series(i,j) = sum(coeffs.*lagged_vals);
        end
    end
end

for i = 1:deps_len2
    % gernerate random coefficient matrix depending on
    % how many dependencies a feature has (eg 3 deps -> 3x3 coeff mat)
    % rounding to one decimal in range coeff_min to coeff_max
    coeffs = round(coeff_min+rand(deps_per2(i)*lag,1)*(coeff_max-coeff_min),1)
    % generate every value from 1 to n
    for j = n1:n1+n2
        % generates lagged values by multiplying dependency matrix
        % with the time series at t-lag:t to get correct values
        lagged_vals = nonzeros(dependencies1(deps2(i),:).*series(:,j-lag:j-1)');
        series(i,j) = sum(coeffs.*lagged_vals);
    end
end


end
