function [err,model,errT] = multireg(xtrain,ytrain,lambda,xtest,ytest)
%
% Finds a D-1 order polynomial fit to the data
%
%    function [err,model,errT] = polyreg(x,y,D,xT,yT)
%
% x = vector of input scalars for training
% y = vector of output scalars for training
% lambda=regularization parameter 
% xT = vector of input scalars for testing
% yT = vector of output scalars for testing
% err = average squared loss on training
% model = vector of parameter coefficients
% errT = average squared loss on testing
%
N = length(xtrain); %length of xtest is the same in 2-fold cross validation

% compute model
model=(inv(xtrain'*xtrain + lambda*(eye(size(xtrain,2)))))*(xtrain'*ytrain); 

% compute error
C = (lambda/(2*N))*(sum(model.^2));
err   = (1/(2*N))*sum((ytrain-xtrain*model).^2)+C;
errT  = (1/(2*N))*sum((ytest-xtest*model).^2)+C;
