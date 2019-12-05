%dependencies = [0 1 1;0 0 0;0 0 0];
%dependencies2 = [0 1 0; 0 0 0; 0 0 0];
%series = data_gen(3,2,dependencies,200);
%series2 = data_gen(3,2,dependencies2,100);
features = 6;

dep1 = zeros(features);
dep2 = zeros(features);

%dep1(1,2) = 1;
dep1(1,2) = 1;
dep1(1,3) = 1;
dep1(1,4) = 1;
dep1(1,5) = 1;
dep1(1,6) = 1;

dep2(1,2) = 1;
dep2(1,3) = 1;
dep2(1,4) = 1;

%s2 = data_gen(10,3,dep2,100);
%s = [s1 s2];
G1 = digraph(dep1);
G2 = digraph(dep2);
% 1 gaussian
% 2 poisson
% 3 binomial
% 4 gamma
dists = [0,3,3,3,4,4];
%dists = [1,2];
lag = 2;
T1 = 200;
T2 = 100;
coeff_min = 0.6;
coeff_max = 0.9;
%T = 200:200:2000;
%T1 = T*0.6;
%T2 = T*0.4;
%for i = 1:1
s1 = data_gen(features,lag,dep1,dep2,T1,T2,dists,coeff_min,coeff_max);
    %save(['syn_data/length/Datatest' num2str(i) ['_4x' num2str(T(i)) '_depstr_2b1ga_t1.txt']], 's1', '-double', '-ascii');
save(['syn_data/nr_deps/Datatest' num2str(5) '_6x300_1anom_3b2ga_t1.txt'], 's1', '-double', '-ascii');
%end