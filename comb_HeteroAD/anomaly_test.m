clear all;

warning off;
pctRunOnAll warning off;

Filename = "syn_data/Testdataset_760_Poisson5_Normal0_Features5.mat"
%train_file = 'TE_process/d03.dat';
%test_file = 'TE_process/d03_te.dat';
%series = [load(train_file)' load(test_file)'];
load(Filename)
series = load(Filename)
series = series.series
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
T1 = 250;
T2 = 510;
window = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 2;
lambda = 4;
alpha = 0.95;

%% do anomaly detection with a sliding window:
disp('Granger -N AD in progress...');
tic;
[granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
		granger_anomaly_detection(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
		alpha, lambda,I_n, I_p, I_g, I_B);

save('Testdataset_760_Poisson5_Normal0_Features5_toResult_mu12.mat');
%save(['TEP_d03_d03te_2_toResults.mat']);