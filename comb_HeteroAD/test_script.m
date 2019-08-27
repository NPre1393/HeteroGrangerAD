clear all;
close all;
clc;

% disable warnings for parfor glm fit
warning off;
pctRunOnAll warning off;
%doc pctRunOnAll

%series = [load(train_file) load(test_file)'];

% parameters for training and test part of time series
% T1(1:T1)     ... reference set indices
% T2(T1+1:end) ... test set indices
%T1 = 500;
%T2 = 960;
%T1 = 125;
%T2 = 240;
T1 = 25;
T2 = 50;

window = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 2;
lambda = 4;
alpha = 0.95;

%% generate anomaly data
Max_Constant = 1;
count=1;
strength=0.3;
traning_data_size=75;
Features=3;

% determine how many time series in data have specific distribution
% p = poisson, n = gaussian, B = bernoulli, g = gamma
%I_p=[1:round(Features*0.7)];
I_p = [];
%I_n=[round(Features*0.7)+1:Features];
I_n = [1:Features];
I_B=[];
I_g=[];
dependency = 3;

% generate test data for different distributions
%Filename = strcat( 'Testdataset4_',num2str(traning_data_size),'_Poisson',num2str(size(I_p,2)),'_Normal',num2str(size(I_B,2)),'_1.mat');
%[series, Ground_Truth]= final_dataGenerator(traning_data_size,Max_Constant,Features,I_n,I_p,I_g,...
%            I_B,strength,dependency,Filename);


series = load(Filename)
series = series.series
% add large number to 201st data point in every time series to make it
% an anomaly
for i = 1:Features
    %series(i, 201) = series(i, 201)+1000;
    series(i, 70) = series(i, 70)+1000;
end
        
        
%% do anomaly detection with a sliding window:
disp('Granger -N AD in progress...');
tic;
[granger_ref_coeffs_N, granger_test_coeffs_N, granger_anomaly_scores_N,granger_threshs_N] = ...
		granger_anomaly_detection(series, L, 1:T1, T1+1-window+1:T1+1, T2-1, ...
		alpha, lambda,I_n, I_p, I_g, I_B);
time_granger_N = toc;
j = 5
save(['TE_process/test' num2str(j) '_totResults.mat']);
