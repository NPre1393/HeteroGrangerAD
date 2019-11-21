clear all;
%dir_name1 = 'datatests/gaussian_GAD/anom_score_mu1mu2/simple_dep_noanom_sliding'
dir_name1 = 'datatests/3pois1gauss1_n';
%dir_name1 = 'datatests/gaussian_other_config';
files = dir(fullfile(dir_name1, '*.mat'));
names = {files.name};
names_cell = strcat(dir_name1, '\', names);

%T1 = 75;
%T2 = 150;
T1 = 200;
T2 = 100;
%window1 = 5;
window1 = 10;
N = 7;
% set lag as in Russel & Chiang:
L = 3;
%lambda2 = 5;
lambda1 = 4;
alpha = 0.95;
features = 4;

ground_truth = zeros(features, T2);
ground_truth(1,1:100) = 1;
%ground_truth = zeros(features, T2/window1);
%ground_truth(1,1:10) = 1;
%ground_truth(4:2:8,11) = 1;

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
f1_scores = zeros(1,10);
precision = zeros(1,10);
recall = zeros(1,10);
accuracy = zeros(1,10);
for j = 1:10
    series_mat = load(char(names_cell(j)));
    series = series_mat.series;
    FinalResult = char(names(j));
    anom_scores = series_mat.granger_anomaly_scores_N;
    anom_thresholds = series_mat.granger_threshs_N;
    [anomaly_mat,~] = eval_anomaly(anom_scores, anom_thresholds, 0);
    %[anomaly_mat,~] = eval_anomaly_b(anom_scores, anom_thresholds, 0, window1);
    %[f1_scores(j), precision(j), recall(j)] = Fmeasure(anomaly_mat(1,:), ground_truth(1,:));
    [f1_scores(j), precision(j), recall(j)] = Fmeasure(anomaly_mat, ground_truth);
    %accuracy(j) = ((T2*features)-nnz(anomaly_mat))/(T2*features);

end
f1_scores
precision
recall
%accuracy