clear all;
close all;
clc;

% disable warnings for parfor glm fit
warning off;
%pctRunOnAll warning off;
%doc pctRunOnAll

%series = [load(train_file) load(test_file)'];

% parameters for training and test part of time series
% T1(1:T1)     ... reference set indices
% T2(T1+1:end) ... test set indices
T1 = 75;
T2 = 150;
%T1 = 125;
%T2 = 240;
%T1 = 25;
%T2 = 50;

window = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 2;
lambda = 4;
alpha = 0.95;

%% generate anomaly data
Max_Constant = 1;
count=1;
strength=0.6;
traning_data_size=T1+T2;
Features=5;

% determine how many time series in data have specific distribution
% p = poisson, n = gaussian, B = bernoulli, g = gamma
%I_n=[1:round(Features*0.7)];
I_p = [];
%I_p=[round(Features*0.7)+1:Features];
I_n = [1:Features];
I_B=[];
I_g=[];
dependency = 5;

% for i = 1:4
%     
%     if i==1
%         I_n = [];
%         I_p = [1:5];
%     elseif i==2
%         I_n = [1:5];
%         I_p = [];
%     elseif i==3
%         I_n=[1:3];
%         I_p=[4:5];
%     else
%         I_p=[1:3];
%         I_n=[4:5];
%     end
%     % generate test data for different distributions
%     Filename = strcat( 'Testdataset_',num2str(traning_data_size),'_Poisson',num2str(size(I_p,2)),'_Normal',num2str(size(I_n,2)),'_Features',num2str(Features),'.mat');
%     [series, Ground_Truth]= final_dataGenerator(traning_data_size,Max_Constant,Features,I_n,I_p,I_g,...
%                 I_B,strength,dependency,Filename);
% 
% end

for i=1:5
   I_n = [1:Features];
   I_p = [];
   
   Filename = strcat( 'Testdataset_',num2str(traning_data_size),'_Normal',num2str(size(I_n,2)),'_Features',num2str(Features),'_',num2str(i),'.mat');
   [series, Ground_Truth]= final_dataGenerator(traning_data_size,Max_Constant,Features,I_n,I_p,I_g,I_B,strength,dependency,Filename);
    
end

%series = load(Filename)
%series = series.series
% add large number to 201st data point in every time series to make it
% an anomaly
%for i = 1:Features
    %series(i, 201) = series(i, 201)+1000;
%    series(i, 70) = series(i, 70)+1000;
%end