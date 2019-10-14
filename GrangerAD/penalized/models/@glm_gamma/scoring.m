function [l,m,D,V,X,beta] = scoring(model,beta)
% SCORING returns the components needed the score and information matrix.
%
% Usage:
%   [l,m,D,V,X] = scoring(model,beta)
%
% Inputs:
%   model : a glm_gamma model.
%   beta  : the coefficient estimate
%
% Outputs:
%   l    : the log-likelihood at beta, l = sum(l(i))
%   m    : m is the vector with elements m(i)= E[(d l(i))/(d mu(i))]
%          where mu(i) = E(y(i))
%   D    : a vector with elements D(i) = (d mu(i))/(d eta(i)) where
%          eta(i) = X(i,:)*beta
%   V    : a vector with elements V(i) = E[(d l(i))/(d mu(i))]^2
%   X    : the jacobian (d eta(i))/(d beta(j)) = X
%
% Notes:
%   score = X'*diag(D)*m, 
%   information matrix = X'diag(D)*diag(V)*diag(D)*X

% next 4 lines from likelihood(m,beta)

if( nnz(beta)==0)
    options = statset(statset('glmfit'));
    options.MaxIter=100000;
    beta=glmfit(model.glm_base.X,model.glm_base.y,'gamma','Options',options,'link','reciprocal','constant','off');
end

eta = predictor(model,beta);
mu  = 1./(eta);
l   = l_from_mu(model,mu);

m = model.glm_base.y./mu-1;
m(isnan(m)) = -1;

V = 1./mu;

D = mu; 
X = model.glm_base.X;

 