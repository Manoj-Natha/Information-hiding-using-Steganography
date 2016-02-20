function [mse,psnr] = mse_psnr(im1,im2)


origImg = double(im1);
distImg = double(im2);
origImg=imresize(origImg,[512 512]);
distImg=imresize(distImg,[512 512]);
[M N] = size(origImg);
 acc = 0;
for k1=1:M
for k2=1:N
acc = acc+ (( origImg(k1,k2) - distImg(k1,k2) )^2);
end
end
mse = acc/(M*N);
if(mse > 0)
 display('manoj');
 psnr = 20*log10(255/(sqrt(mse)));
%PSNR = 10*log(255*255/MSE) / log(10);
else
  psnr = 99;
end 
 %display(psnr);
 end


%N = size(im1);
%x=im2double(im1);
%y=im2double(im2);
%acc = 0;

%for k1=1:N(1)
%for k2=1:N(2)
%acc = acc+ (( x(k1,k2) - y(k1,k2) )^2);
%end
%end
%mse = acc/(N(1)*N(2));
%psnr = 10*log10((255^2)/mse);
%psnr = 20*log10(255/(sqrt(mse)));
%[peaksnr,snr]=psnr(im1,im2);

