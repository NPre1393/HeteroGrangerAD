function [anomaly_mat, h] = eval_anomaly(anomaly_scores,thresholds, hm)
%EVAL_ANOMALY uses threshold to find out if value at timepoint t
%             is anomalous & plots heatmap if wanted
% anomaly_scores - anomaly scores from anomaly detection algorithm dim [n x m]
% thresholds - threshold values specified by AD algorithm dim [n x 1]
% hm - optional parameter, plot heatmap if hm = 1
h = 0;
[n, m] = size(anomaly_scores);

anomaly_mat = anomaly_scores;
for i=1:n
    anomaly_mat(i,anomaly_scores(i,:)>thresholds(i))=1;
    anomaly_mat(i,anomaly_scores(i,:)<=thresholds(i))=0;
end

%imagesc((1:m)+0.5, (1:n)+0.5,anomaly_mat);
%colormap(gray);
%axis equal
%set(gca, 'XTick', 1:(m+1), 'YTick', 1:(n+1), ...
%         'XLim', [1 m+1], 'YLim', [1 n+1], ...
%         'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');
%set(gcf, 'position', [10,10,550,400])
if hm == 1
   h = heatmap(anomaly_mat, 'Colormap', gray, 'ColorLimits', [0 1]);
end
end

