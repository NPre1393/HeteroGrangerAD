clear all;
%dir_name1 = 'datatests/gaussian_GAD/w10_la4_L2_mu1mu2';
%dir_name1 = 'datatests/gaussian_GAD/w5_la4_L3';
dir_name1 = 'datatests/gaussian_GAD/adjusted_anom_score/scaled_10x300_468';
%dir_name1 = 'datatests/gaussian_other_config';
files = dir(fullfile(dir_name1, '*.mat'));
names = {files.name};
names_cell = strcat(dir_name1, '\', names);

%T1 = 75;
%T2 = 150;
T1 = 100;
T2 = 200;
%window1 = 5;
window1 = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 3;
%lambda2 = 5;
lambda1 = 4;
alpha = 0.95;
features = 10;

%ground_truth = zeros(features, T2);
%ground_truth(:,101) = 1;
ground_truth = zeros(features, T2/window1);
ground_truth(4:2:8,11) = 1;

% x = 1:225
% figure;
% plot(x, series(1,:), 'r');
% hold on;
% plot(x, series(2,:), 'g');
% hold on;
% plot(x, series(3,:), 'y');
% hold on;
% plot(x, series(4,:), 'b');
% hold on;
% plot(x, series(5,:), 'm');
% hold off;
f1_scores = zeros(1,features);
precision = zeros(1,features);
recall = zeros(1,features);

for j = 1:10
    series_mat = load(char(names_cell(j)));
    series = series_mat.series;
    FinalResult = char(names(j));
    anom_scores = series_mat.granger_anomaly_scores_N;
    anom_thresholds = series_mat.granger_threshs_N;
    [anomaly_mat,~] = eval_anomaly(anom_scores, anom_thresholds, 0);
    %[anomaly_mat,~] = eval_anomaly_b(anom_scores, anom_thresholds, 0, window1);
    [f1_scores(j), precision(j), recall(j)] = Fmeasure(anomaly_mat, ground_truth);
end
f1_scores
precision
recall