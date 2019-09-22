clear all;

warning off;
pctRunOnAll warning off;
Filename = "syn_data/Testdataset_760_Poisson3_Normal2_Features5.mat";
%dir_name = 'C:\Users\Julien\Documents\Uni\Master\DataScience\pr\PR1\PR1\GrangerAD\GrangerAD\syn_data';
dir_name = 'syn_data';
files = dir(fullfile(dir_name, '*.mat'));
names = {files.name};
names_cell = strcat(dir_name, '\', names); 

T1 = 250;
T2 = 510;
window = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 2;
lambda = 4;
alpha = 0.95;
%Filename = "syn_data/Testdataset_760_Poisson5_Normal0_Features5.mat"
%train_file = 'TE_process/d03.dat';
%test_file = 'TE_process/d03_te.dat';
%series = [load(train_file)' load(test_file)'];
%ts_dists = {{{},{1:5}},{{1:2},{3:5}},{{1:3},{4:5}},{{1:5},{}}};
%ts_dists = {{{1:2},{3:5}},{{1:3},{4:5}},{{1:5},{}}};

%[m,n] = size(ts_dists);
for j=1:4
    %ind = [ts_dists{j}]
    series_mat = load(char(names_cell(j)));
%series = load(Filename)
    series = series_mat.series;
    FinalResult = char(names(j))
% add large number to 201st data point in every time series to make it
% an anomaly
%for i = 1:3
    %series(i, 201) = series(i, 201)+1000;
    %series(1, 70) = series(i, 70)+1000;
%end
% data point at index 240 of test data is anomalous
    series(2, 490) = series(2, 490)+10000;
%T1 = 125;
%T2 = 240;
    %ind_poiss = cell2mat(ts_dists{1,i}{1,1});
    %ind_gauss = cell2mat(ts_dists{1,i}{1,2});

    I_B=[];
    I_g=[];
    I_n=series_mat.I_n;
    I_p=series_mat.I_p;

%% do anomaly detection with a sliding window:
    disp('Granger -N AD in progress...');
    tic;
    [granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
            granger_anomaly_detection(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
            alpha, lambda,I_n, I_p, I_g, I_B);

    %save('Testdataset_760_Poisson5_Normal0_Features5_toResult.mat');

    save([FinalResult num2str(j)  '_HGGM_Result.mat']);
%save(['TEP_d03_d03te_2_toResults.mat']);
end