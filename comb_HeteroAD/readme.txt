************************************************************
* Code for anomaly detection using Granger graphical models*
* original by Huida Qiu                                    *
* adjusted by Niklas Preschern							   *
************************************************************

granger_anomaly_detection contains the combined code from the papers
Granger Causality for Time-Series Anomaly Detection and Granger Causality
for Heterogeneous Processes

differences:
	- uses GLM instead of Lasso for finding temporal dependencies
	- uses Jensen–Shannon divergence instead of Kullback–Leibler divergence for anomaly
	  scores
	- uses different anomaly scores for differently distributed timeseries
