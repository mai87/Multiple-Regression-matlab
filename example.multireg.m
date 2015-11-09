indices = crossvalind('Kfold',size(y,1),2); %2 fold CV
test=(indices==1);train=~test;%use different indices to split data into half
ediflambda=zeros(length(lambdas),2) %create matrix with all zeros in
lambdas = 0:.5:1000;
for i=1:numel(lambdas)%lambda from 1 to 1000
    [err,model,errT] = multireg(x(train,:),y(train),lambdas(i),x(test,:),y(test));
    ediflambda(i,:)=[err,errT]%record training err and testing error
end
%inverse lambda for the plot, make the largest registration on the most
%left side, when lambda = 10^3

%invlambda=logspace(-6,3,10);
trainerror=ediflambda(:,1);
testerror=ediflambda(:,2);
figure;
plot(lambdas,trainerror,'--go',lambdas,testerror,':r*')
title('Graph of train error and test error for different lambda')
xlabel('lambda')
ylabel('error')
legend('trainerror','testerror')
