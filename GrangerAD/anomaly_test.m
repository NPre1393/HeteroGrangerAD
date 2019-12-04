clear all;

warning off;
%pctRunOnAll warning off;
%dir_name = 'C:\Users\Julien\Documents\Uni\Master\DataScience\pr\PR1\PR1\GrangerAD\GrangerAD\syn_data';
%dir_name = 'syn_data\gaussian_GAD';
dir_name = 'syn_data\3g';
folder = '3g/';
files = dir(fullfile(dir_name, '*.txt'));
names = {files.name};
names_cell = strcat(dir_name, '\', names); 

T1 = 10;
T2 = 5;
window = 1;
L = 3;
lambda = 4;
alpha = 0.95;
%train_file = 'TE_process/d03.dat';
%test_file = 'TE_process/d03_te.dat';
%series = [load(train_file)' load(test_file)'];

%[m,n] = size(ts_dists);
for i = 1:1
    if i == 2
        folder = '3ga/';
        dir_name = 'syn_data\3ga';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
    end
    
    if i == 3
        folder = '3p/';
        dir_name = 'syn_data\3p';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
    end 
    for j=1:1
    
    FinalResult = char(names(j))
    %FinalResult = 'TEP_d03';
    series = dlmread(char(names_cell(j)));
    
    %% do anomaly detection with a sliding window:
    disp('Granger GLM AD in progress...');
    %tic;
    [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
        granger_glm_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
        alpha, lambda);
    
%     save([['datatests/',folder],FinalResult num2str(j)  '_GLM_Result.mat']);
    %save(['datatests/', FinalResult '_GLM_Result.mat']);
%     disp('Granger -N AD in progress...');
%     [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N, ...
%         granger_threshs_N] = ...
%         granger_lasso_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
%         alpha, 1000, 2000, 800, 0);
%     %alpha, 1000, 2000, 800, 0);
    
%     save([['datatests/',folder], FinalResult num2str(j)  '_Lasso_Result.mat']);
    %save(['datatests/', FinalResult '_Lasso_Result.mat']);

    
    end
end