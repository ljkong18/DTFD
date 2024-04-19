function L=LBP(X)
[h,w,k]=size(X);
for j=1:k
E=X(:,:,j);
b=extractLBPFeatures(E);
p(j)=sum(b,"all");
L(j)=p(j);
end
end