function Fcrs=coarseness1(X)
% X = imresize(X, 2);
[h,w,f]=size(X);
% for n=1:f
    graypic=X(:,:,:);
    if h>4 && w>4
        kmax=2;
    else
        kmax=1;
    end
    A=zeros(h,w,f,kmax);
    Eh = A;
    Ev = A;
    for i=2^(kmax-1)+1:h-2^(kmax-1)
        for j=2^(kmax-1)+1:w-2^(kmax-1)
            for k=1:kmax
                A(i,j,:,k)=mean(graypic(i-2^(k-1):i+2^(k-1)-1,j-2^(k-1):j+2^(k-1)-1,:),[1 2]);
            end
        end
    end
    for i=1+2^(kmax-1):h-2^(kmax-1)
        for j=1+2^(kmax-1):w-2^(kmax-1)
            for k=1:kmax
                Eh(i,j,:,k)=abs(A(i+2^(k-1),j,:,k)-A(i-2^(k-1),j,:,k));
                Ev(i,j,:,k)=abs(A(i,j+2^(k-1),:,k)-A(i,j-2^(k-1),:,k));                
            end
        end
    end
    for i=2^(kmax-1)+1:h-2^(kmax-1)
        for j=2^(kmax-1)+1:w-2^(kmax-1)
            [maxEh,p]=max(Eh(i,j,:,:),[],4);
            [maxEv,q]=max(Ev(i,j,:,:),[],4);
            temp = maxEh>maxEv;
            maxkk(temp) = p(temp);
            maxkk(~temp) = q(~temp);
            Sbest(i,j,:)=2.^maxkk;
        end
    end
    Fcrs=mean(Sbest,[1 2]);
    Fcrs = permute(Fcrs,[1 3 2]);
% end