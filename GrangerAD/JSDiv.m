function dist=JSDiv(P,Q)
% Jensen-Shannon divergence of two probability distributions
%  dist = JSD(P,Q) Kullback-Leibler divergence of two discrete probability
%  distributions
%  P and Q  are automatically normalised to have the sum of one on rows
% have the length of one at each 
% P =  n x nbins
% Q =  1 x nbins
% dist = n x 1
if size(P,2)~=size(Q,2)
    error('the number of columns in P and Q should be the same');
end
% normalizing the P and Q
Q = Q ./repmat(sum(Q,2),[1 size(Q,2)]);
P = P ./repmat(sum(P,2),[1 size(P,2)]);
M=log(P./Q);
M(isnan(M))=0;
dist = sum(P.*M,2);
end