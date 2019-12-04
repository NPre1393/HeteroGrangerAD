function [I_n, I_p, I_g, I_B] = getDistributions(series)
%warning off;

% set a random lag less than 5
L = round(4*rand()+1);
[p,N]=size(series);

I_n=[];
I_p=[];
I_g=[];
I_B=[];

for i=1:p
    %display(strcat('Time Series',num2str(i)));
    Best_Dist=fitDistribution(series(i,:)',L);
    
    switch Best_Dist
        case 1
            I_n=[I_n,i];
        case 2
            I_p=[I_p,i];
        case 3
            I_g=[I_g,i];
        case 4
            I_B=[I_B,i];            
    end
    
end