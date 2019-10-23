%dependencies = [0 1 1;0 0 0;0 0 0];
%dependencies2 = [0 1 0; 0 0 0; 0 0 0];
%series = data_gen(3,2,dependencies,200);
%series2 = data_gen(3,2,dependencies2,100);

dep1 = zeros(3);
dep2 = zeros(3);

dep1(1,2) = 1;
dep1(1,3) = 1;

dep2(1,2) = 1;


%s2 = data_gen(10,3,dep2,100);
%s = [s1 s2];
G1 = digraph(dep1);
G2 = digraph(dep2);
for i = 1:5
    s1 = data_gen(3,2,dep1,dep2,200,100);
    save(['Datatest' num2str(i) '_3x300.txt'], 's1', '-double', '-ascii');
end