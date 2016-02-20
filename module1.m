 %c = imread('lena512.bmp');
  c = imread('15.gif');
 %c=imresize(c1,0.05);
  %c=rgb2gray(c);
  message = 'hi my name is neela !!and i am tryin out my image processing project.I am tryin it out with a paragraph of lettters to make sure that it is running properly so now it will work for more than 255 characters as well so lets see if it is gonna '
    message = strtrim(message);
    m = length(message);
    m1=m*8;
    display(m);
    AsciiCode = uint8(message);
    binaryString =transpose(dec2bin(AsciiCode,8));
   binaryString = binaryString(:);
  %s display(binaryString);
    N = length(binaryString);
    b = zeros(N,1); %b is a vector of bits
    for k = 1:N
        if(binaryString(k) == '1')
            b(k) = 1;
        else
            b(k) = 0;
        end
    end
s =c;
    height = size(c,1);
    width = size(c,2);
     k = 1;
    for i = 1 : height
        for j = 1 : width
             LSB = mod(double(c(i,j)), 2);
             if(i==1 && j==1)
                 s(i,j)=m;
             else if ((k>m1 || LSB == b(k)))
                s(i,j) = c(i,j);
              else if(LSB == 1)
                    s(i,j) = c(i,j) - 1;
                    else
                    s(i,j) = c(i,j) + 1;
                    end
                 end
             end
               k = k + 1;
              if(i==1 && j==1)
                  k=k-1;
              end
        end
    end
    imwrite(s, 'hiddenmsgimage.png');
    JJ=imread('29.gif');
    II=imread('hiddenmsgimage.png');
    i1=im2double(JJ);
j1=im2double(II);
origImg = double(i1);
distImg = double(j1);
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
 psnr = 20*log10(255/(sqrt(mse)));
%PSNR = 10*log(255*255/MSE) / log(10);
else
  psnr = 99;
end 
 display(psnr);