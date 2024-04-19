function [Xtest,Xquery] = pca_whitening(Xtest,Xtrain,Xquery,d)
%YEAL_PCA 此处显示有关此函数的摘要
%   此处显示详细说明
Xtest =  normalize(Xtest,2,'norm');
Xtrain =  normalize(Xtrain,2,'norm');
mu = nanmean(Xtrain);
Xcov = cov(Xtrain, 'omitrows');
Xcov(isnan(Xcov)) = 0;
[u,s,~] = svd(Xcov);

Xtest = Xtest - mu;
xRot = Xtest * u;
epsilon=1*10^(-5);
x = xRot * diag(1./(sqrt(diag(s)+epsilon)));
x(isnan(x)) = 0;
Xtest = x(:,1:d);

Xquery =  normalize(Xquery,2,'norm');
Xquery = Xquery - mu;
xRot = Xquery * u;

x = xRot * diag(1./(sqrt(diag(s)+epsilon)));
x(isnan(x)) = 0;
Xquery = x(:,1:d);

Xtest =  normalize(Xtest,2,'norm');
Xquery =  normalize(Xquery,2,'norm');
end


