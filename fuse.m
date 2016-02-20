function psnr=fuse(filename,a,stego,c)
display('hello');
display(filename);
M1 = imread(filename);
M2 = imread(stego);
M1=rgb2gray(M1);

%M2=rgb2gray(M2);

M1=im2double(M1);

M2=im2double(M2);

M1=imresize(M1,[512 512]);

M2=imresize(M2,[512 512]);
%N = size(M1);
%display(N(1));
%display(N(2));
%N = size(M2);
%display(N(1));
%display(N(2));


FusedImage= (a*M1) + ((1-a)*M2);



imwrite(FusedImage, 'FusedImage.png');

M3 = imread(stego);

FusedImage1 = imread('FusedImage.png');

M3=im2double(M3);

FusedImage1=im2double(FusedImage1);

M4=(FusedImage - (a*M1)) / (1-a);

imwrite(M4, 'M4.png');
if(c==0)
[mse,psnr]=mse_psnr(M2,M4);
else if(c==1)
 [mse,psnr]=mse_psnr(FusedImage1,M1);
end    
end
