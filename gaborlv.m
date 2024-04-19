function mag = gaborlv(X)
[h,w,k]=size(X);

for j=1:k 
  im=X(:,:,j);
wavelength = 7;
orientation = 0;
[mag1,~] = imgaborfilt(im,wavelength,orientation);
wavelength = 7;
orientation = 30;
[mag2,~] = imgaborfilt(im,wavelength,orientation);
wavelength = 7;
orientation = 60;
[mag3,~] = imgaborfilt(im,wavelength,orientation);
wavelength = 7;
orientation = 90;
[mag4,~] = imgaborfilt(im,wavelength,orientation);
wavelength = 7;
orientation = 120;
[mag5,~] = imgaborfilt(im,wavelength,orientation);
wavelength = 7;
orientation = 150;
[mag6,~] = imgaborfilt(im,wavelength,orientation);
mag(:,:,j) = (mag1+mag2+mag3+mag4+mag4+mag5+mag6)./6;
% mag(j)=mag;
end
end

