%dependencies = [0 1 1;0 0 0;0 0 0];
%dependencies2 = [0 1 0; 0 0 0; 0 0 0];
%series = data_gen(3,2,dependencies,200);
%series2 = data_gen(3,2,dependencies2,100);

dep1 = zeros(12);
dep2 = zeros(12);

dep1(1,4) = 1;
dep1(1,5) = 1;

dep2(1,10) = 1;
dep2(1,6) = 1;

dep1(2,6) = 1;
dep1(2,7) = 1;

dep2(2,7) = 1;
dep2(2,5) = 1;

dep1(3,8) = 1;
dep1(3,9) = 1;

dep2(3,11) = 1;
dep2(3,12) = 1;
dists = [0,0,0,2,2,2,2,1,1,2,1,1];
s1 = data_gen(12,2,dep1,dep2,200,100, dists);

% dep1 = zeros(10);
% dep2 = zeros(10);
% dep1(1,7) = 1;
% dep1(1,8) = 1;
% dep1(1,9) = 1;
% 
% dep2(1,4) = 1;
% dep2(1,5) = 1;
% dep2(1,6) = 1;
% 
% dep1(2,6) = 1;
% dep1(2,7) = 1;
% dep1(2,8) = 1;
% 
% dep2(2,8) = 1;
% dep2(2,9) = 1;
% dep2(2,10) = 1;
% 
% dep1(3,5) = 1;
% dep1(3,6) = 1;
% dep1(3,7) = 1;
% 
% dep2(3,6) = 1;
% dep2(3,7) = 1;
% dep2(3,8) = 1;
% dists = [0,0,0,1,1,1,1,1,1,1];
% s2 = data_gen(10,3,dep1,dep2,200,100,dists);
%s2 = data_gen(10,3,dep2,100);
%s = [s1 s2];

G1 = digraph(dep1);
G2 = digraph(dep2);
save('Datatest5_10x300_2pois1gaus.txt', 's1', '-double', '-ascii');
