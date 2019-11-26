%dependencies = [0 1 1;0 0 0;0 0 0];
%dependencies2 = [0 1 0; 0 0 0; 0 0 0];
%series = data_gen(3,2,dependencies,200);
%series2 = data_gen(3,2,dependencies2,100);
features = 4;

dep1 = zeros(features);
dep2 = zeros(features);

dep1(1,2) = 1;
dep1(1,3) = 1;
dep1(1,4) = 1;

dep2(1,2) = 1;
dep2(1,3) = 1;

%s2 = data_gen(10,3,dep2,100);
%s = [s1 s2];
G1 = digraph(dep1);
G2 = digraph(dep2);
% 1 gaussian
% 2 poisson
% 3 binomial
% 4 gamma
dists = [0,3,3,4];
%dists = [1,2];
lag = 2;
for i = 1:5
    s1 = data_gen(features,lag,dep1,dep2,200,100,dists);
    save(['Datatest' num2str(i) '_4x300_2b1g_t1.txt'], 's1', '-double', '-ascii');
end