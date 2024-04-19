function  [Fdire,sita]=directionlity(X)
[h,w,f]=size(X);
for d=1:f
graypic=X(:,:,d);
GradientH=[-1 0 1;-1 0 1;-1 0 1];
GradientV=[1 1 1;0 0 0;-1 -1 -1];
MHconv=conv2(graypic,GradientH);
MH=MHconv(3:h,3:w);
MVconv=conv2(graypic,GradientV);
MV=MVconv(3:h,3:w);
MG=(abs(MH)+abs(MV))./2;
validH=h-2;
validW=w-2;
for i=1:validH
    for j=1:validW
        sita(i,j)=atan(MV(i,j)/MH(i,j))+(pi/2);
        
    end
end
n=16;
t=12;
Nsita=zeros(1,n);
for i=1:validH
    for j=1:validW
        for k=1:n
            if sita(i,j)>=(2*(k-1)*pi/2/n)&&sita(i,j)<((2*(k-1)+1)*pi/2/n)&&MG(i,j)>=t
                Nsita(k)=Nsita(k)+1;
                
            end
        end
    end
end
for k=1:n
    HD(k)=Nsita(k)/sum(Nsita(:));
    if HD(k)>0
        HD(k)=HD(k);
    else
        HD(k)=0;
    end
end
[maxvalue,FIp]=max(HD);
Fdir=0;
for k=1:n
    Fdir=Fdir+(k-FIp)^2*HD(k);
end
Fdire(d)=Fdir;
end
end