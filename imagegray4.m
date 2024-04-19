function x = imagegray4(feature_mat)
%IMAGEGRAY 此处显示有关此函数的摘要
%   此处显示详细说明
num=size(feature_mat,3);
% fea = zeros(w,h);
%[0 1]
for i=1:num
    %灰度共生矩
    glcm=graycomatrix(feature_mat(:,:,i),'NumLevels',8,'Offset',[0 1],'GrayLimits',[]);
    glcm=glcm./sum(sum(glcm));
    [m,n]=size(glcm);
%     %能量
    ASM=sum(sum(glcm.^2));
%     %对比度
%     CON=0;
%     for j=1:m
%         for k=1:n
%             CON=CON+((j-k)^2)*glcm(j,k);
%         end
%     end
    %相关度
%     IDE=0;
%     for j=1:m
%         for k=1:n
%             IDE=IDE+glcm(j,k)./(1+(j-k)^2);
%         end
%     end
    %熵
%     ENT=0;
%     for j=1:m
%         for k=1:n
%             if glcm(j,k)>0
%                 ENT=ENT+(-glcm(j,k)*log2(glcm(j,k)));
%             end
%         end
%     end
    
%     x1(i,:)=[ASM,CON,IDE,ENT];
    x1(i,:)=ASM;
end
% [-1 1]
for i=1:num
    %灰度共生矩阵
    glcm=graycomatrix(feature_mat(:,:,i),'NumLevels',8,'Offset',[-1 1],'GrayLimits',[]);
    glcm=glcm./sum(sum(glcm));
    [m,n]=size(glcm);
%     %能量
    ASM=sum(sum(glcm.^2));
%     %对比度
%     CON=0;
%     for j=1:m
%         for k=1:n
%             CON=CON+((j-k)^2)*glcm(j,k);
%         end
%     end
%     %相关度
%     IDE=0;
%     for j=1:m
%         for k=1:n
%             IDE=IDE+glcm(j,k)./(1+(j-k)^2);
%         end
%     end
    %熵
%     ENT=0;
%     for j=1:m
%         for k=1:n
%             if glcm(j,k)>0
%                 ENT=ENT+(-glcm(j,k)*log2(glcm(j,k)));
%             end
%         end
%     end
    
%     x2(i,:)=[ASM,CON,IDE,ENT];
    x2(i,:)=ASM;
end
%[-1 0]
for i=1:num
    %灰度共生矩阵
    glcm=graycomatrix(feature_mat(:,:,i),'NumLevels',8,'Offset',[-1 0],'GrayLimits',[]);
    glcm=glcm./sum(sum(glcm));
    [m,n]=size(glcm);
%     %能量
    ASM=sum(sum(glcm.^2));
%     %对比度
%     CON=0;
%     for j=1:m
%         for k=1:n
%             CON=CON+((j-k)^2)*glcm(j,k);
%         end
%     end
%     %相关度
%     IDE=0;
%     for j=1:m
%         for k=1:n
%             IDE=IDE+glcm(j,k)./(1+(j-k)^2);
%         end
%     end
    %熵
%     ENT=0;
%     for j=1:m
%         for k=1:n
%             if glcm(j,k)>0
%                 ENT=ENT+(-glcm(j,k)*log2(glcm(j,k)));
%             end
%         end
%     end
    
%     x3(i,:)=[ASM,CON,IDE,ENT];
    x3(i,:)=ASM;
end
% %[-1 -1]
for i=1:num
    %灰度共生矩阵
    glcm=graycomatrix(feature_mat(:,:,i),'NumLevels',8,'Offset',[-1 -1],'GrayLimits',[]);
    glcm=glcm./sum(sum(glcm));
    [m,n]=size(glcm);
%     %能量
    ASM=sum(sum(glcm.^2));
%     %对比度
%     CON=0;
%     for j=1:m
%         for k=1:n
%             CON=CON+((j-k)^2)*glcm(j,k);
%         end
%     end
%     %相关度
%     IDE=0;
%     for j=1:m
%         for k=1:n
%             IDE=IDE+glcm(j,k)./(1+(j-k)^2);
%         end
%     end
    %熵
%     ENT=0;
%     for j=1:m
%         for k=1:n
%             if glcm(j,k)>0
%                 ENT=ENT+(-glcm(j,k)*log2(glcm(j,k)));
%             end
%         end
%     end
%     
%     x4(i,:)=[ASM,CON,IDE,ENT];
    x4(i,:)=ASM;
end
x=(x1+x2+x3+x4)./4;
x=x';
% [~,index1]=sort(x,'descend');
% save index1;
% x=sum(x,2);
% [m,n]=size(x1);
% gray=zeros(1,(m*n));
% k=1;
% for i=1:m
%     for j=1:n
%         gray(k)=x1(i,j);
%         k=k+1;
%     end
% end

end

