%dependencies = [0 1 1;0 0 0;0 0 0];
%dependencies2 = [0 1 0; 0 0 0; 0 0 0];
%series = data_gen(3,2,dependencies,200);
%series2 = data_gen(3,2,dependencies2,100);

dep1 = zeros(4);
dep2 = zeros(4);

% dep1(1,2) = 1;
% dep1(1,3) = 1;
% dep1(1,4) = 1;
% 
% dep2(1,2) = 1;
% dep2(1,3) = 1;

%s2 = data_gen(10,3,dep2,100);
%s = [s1 s2];
G1 = digraph(dep1);
G2 = digraph(dep2);
%dists = [0,2,2,1];
dists = [1,1];
features = 2;
lag = 2;
for i = 1:5
    s1 = data_gen(features,lag,dep1,dep2,200,100,dists);
    save(['Datatest' num2str(i) '_2x300_nodep.txt'], 's1', '-double', '-ascii');
end