clear all;

warning off;
pctRunOnAll warning off;
%dir_name = 'C:\Users\Julien\Documents\Uni\Master\DataScience\pr\PR1\PR1\GrangerAD\GrangerAD\syn_data';
%dir_name = 'syn_data\gaussian_GAD';
%dir_name = 'syn_data\dep_str';
%folder = 'dep_str/';
%files = dir(fullfile(dir_name, '*.txt'));
%names = {files.name};
%names_cell = strcat(dir_name, '\', names); 

window = 10;
%window = 10;

L = 3;
lambda = 4;
alpha = 0.95;
%train_file = 'TE_process/d03.dat';
%test_file = 'TE_process/d03_te.dat';
%series = [load(train_file)' load(test_file)'];

%[m,n] = size(ts_dists);
for i = 2:4
    if i == 1
        T1 = 200;
        T2 = 100;

        folder = 'dep_str/';
        dir_name = 'syn_data\dep_str';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
        n = 5;
        p1 = 1;
    end
    if i == 2
        %T = 200:200:2000;
        T = [2000,200,400,600,800,1000,1200,1400,1600,1800];
        T1 = T*0.6;
        T2 = T*0.4;

        folder = 'length/';
        dir_name = 'syn_data\length';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
        n = 10;
        p1 = 1;
    end
    if i == 3
        T1 = 200;
        T2 = 100;

        folder = 'anom_fts/';
        dir_name = 'syn_data\anom_fts';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
        n = 4;
        pit = 1;
        p1 = 2:5;
    end 
    if i == 4
        T1 = 200;
        T2 = 100;

        folder = 'nr_deps/';
        dir_name = 'syn_data\nr_deps';
        %files = dir(fullfile(dir_name, '*.mat'));
        files = dir(fullfile(dir_name, '*.txt'));
        names = {files.name};
        names_cell = strcat(dir_name, '\', names); 
        n = 5;
        p1 = 1;
    end 
    for j=1:n
        FinalResult = char(names(j))
        %FinalResult = 'TEP_d03';
        series = dlmread(char(names_cell(j)));
        if i == 2
            %% do anomaly detection with a sliding window:
            disp('Granger GLM AD in progress...');
            %tic;
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
                granger_glm_AD_sliding(series, L, 1:T1(j), T1(j)+1-window+1:T1(j)+1, T2(j)-1, ...
                alpha, lambda, p1);
            save([['datatests/',folder],FinalResult num2str(j)  '_GLM_Result.mat']);

            disp('Granger -N AD in progress...');
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N, ...
            granger_threshs_N] = ...
            granger_lasso_AD_sliding(series, L, 1:T1(j), T1(j)+1-window+1:T1(j)+1, T2(j)-1, ...
            alpha, 1000, 2000, 800, 0, p1); 
            save([['datatests/',folder], FinalResult num2str(j)  '_Lasso_Result.mat']);
        elseif i == 3
            %% do anomaly detection with a sliding window:
            disp('Granger GLM AD in progress...');
            %tic;
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
                granger_glm_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
                alpha, lambda,p1(j)); 
            save([['datatests/',folder],FinalResult num2str(j)  '_GLM_Result.mat']);

            disp('Granger -N AD in progress...');
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N, ...
                granger_threshs_N] = ...
                granger_lasso_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
                alpha, 1000, 2000, 800, 0,p1(j));
            save([['datatests/',folder], FinalResult num2str(j)  '_Lasso_Result.mat']);

            pit = pit+1;
        else
            %% do anomaly detection with a sliding window:
            disp('Granger GLM AD in progress...');
            %tic;
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
                granger_glm_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
                alpha, lambda,p1);  
            save([['datatests/',folder],FinalResult num2str(j)  '_GLM_Result.mat']);
            %save(['datatests/', FinalResult '_GLM_Result.mat']);

            disp('Granger -N AD in progress...');
            [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N, ...
                granger_threshs_N] = ...
                granger_lasso_AD_sliding(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
                alpha, 1000, 2000, 800, 0,p1);
            save([['datatests/',folder], FinalResult num2str(j)  '_Lasso_Result.mat']);
            %save(['datatests/', FinalResult '_Lasso_Result.mat']);        
        end
    end
end