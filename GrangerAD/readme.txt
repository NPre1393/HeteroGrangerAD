************************************************************
* Code for anomaly detection using Granger graphical models*
* original by Huida Qiu                                    *
* adjusted by Niklas Preschern							   *
************************************************************

granger_anomaly_detetion.m and granger_stoc_anomaly_detection.m are the main functions. The latter one uses stochastic methods for L1-regularized regression.

The other functions and packages are required in these two main functions.

TE_test_script.m and test_StocMethods.m show examples how to use the functions.

new extension is granger_anomaly_detection_glm.m which changed the lasso approach to use
generalized linear models instead of lasso

syn_data contains synthetic data generated with final_dataGenerator.m

datatests contains resulting .mat files from the glm and original AD algorithm