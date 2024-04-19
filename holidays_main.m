tic
dim = [128,256,512];
 
% Tamura_holidays;
for i = 1:size(dim,2)
clear;
d=dim(i);
% d=256;
% d=512;
holiday_whitten;
fprintf('dim = %d  mAP = %.4f\n',dim(i),mAP(i));
 end
toc