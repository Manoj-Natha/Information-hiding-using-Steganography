a=imread('hiddenmsgimage.png');
%a=rgb2gray(a);
a=imresize(a,[512 512]);
a=int16(a);
%display(a);
%a=[64,2,3,61,60,6,7,57;9,55,54,12,13,51,50,16;17,47,46,20,21,43,42,24;40,26,27,37,36,30,31,33;32,34,35,29,28,38,39,25;41,23,22,44,45,19,18,48;49,15,14,52,53,11,10,56;
  %  8,58,59,5,4,62,63,1];
%display(a);
%display(a);
[r,c]=size(a);
%display(r);
%display(c);
z=a;
    for i=1:1:r
   k=1;
        t=(r/2+1);
       z=func1(z,t,c,i,r,k); 
    end  
    
      z=transpose(z);
 for i=1:1:r
   k=1;
        t=(r/2+1);
       z=func1(z,t,c,i,r,k); 
    end  
  z=transpose(z);
imwrite(z,'haar.jpg');
imshow('haar.jpg');
%display(z);
ll=zeros(256);
lh=zeros(256);
hl=zeros(256);
hh=zeros(256);
%display(z);
for i=1:1:256
     for j=1:1:256    
         ll(i,j)=z(i,j);
     end
end

for i=1:1:256
    a=1;
     for j=257:1:512    
          lh(i,a)=z(i,j);
          a=a+1;
     end
end
a=1;
for i=257:1:512
     for j=1:1:256    
          hl(a,j)=z(i,j);
     end
     a=a+1;
end
a=1;b=1;
for i=257:1:512
    b=1;
    for j=257:1:512    
          hh(a,b)=z(i,j);
          b=b+1;
     end
     a=a+1;
end
%display(ll);
%display(lh);
%display(hl);
%display(hh);
bri=0;
for i=1:1:256
     for j=1:1:256 
         bri=bri+ll(i,j);
         end
end
display(bri);
tex=0;
papa=0;
aaa=0;bbb=0;ccc=0;
for i=1:1:256
    for j=1:1:256
        aaa=aaa+lh(i,j);
        if ( abs(lh(i,j)) < 1)
            papa=papa + 1;
        end
    end
end
for i=1:1:256
    for j=1:1:256
        bbb=bbb+hl(i,j);
        if ( abs(hl(i,j)) < 1)
            papa=papa + 1;
        end
    end
end
for i=1:1:256
    for j=1:1:256
        ccc=ccc+hh(i,j);
        if ( abs(hh(i,j)) < 1)
            papa=papa + 1;
        end
    end
end
tex=abs(aaa)+abs(bbb)+abs(ccc);
display(tex);
 n=256*256;
display(n);
mlh=0;
mhl=0;
mhh=0;
for i=1:1:256
 for j=1:1:256
     mlh=mlh+lh(i,j);
     mhl=mhl+hl(i,j);
     mhh=mhh+hh(i,j);
 end
end
mlh=mlh/n;
mhl=mhl/n;
mhh=mhh/n;
%display(mlh);
%display(mhl);
%display(mhh);
k1=0;
for i=1:1:256
for j=1:1:256
k1=k1+((lh(i,j)-mlh)^2);
end
end
k2=0;
for i=1:1:256
for j=1:1:256
k2=k2+((hl(i,j)-mhl)^2);
end
end
k3=0;
for i=1:1:256
for j=1:1:256
k3=k3+((hh(i,j)-mhh)^2);
end
end
%display(k1);
%display(k2);
%display(k3);
m1=k1/65535;
m2=k2/65535;
m3=k3/65535;
%display(m1);
%display(m2);
%display(m3);
var=(m1+m2+m3)/3;
display(var);


bmax=0;
for i=1:1:256
for j=1:1:256
    if (ll(i,j) > bmax)
        bmax=ll(i,j);
    end
end
end
%display(bmax);
tmax=0;
for i=257:1:512
for j=1:1:512
    if (z(i,j) > tmax)
        tmax=z(i,j);
    end
end
end
for i=1:1:256
for j=257:1:512
    if (z(i,j) > tmax)
        tmax=z(i,j);
    end
end
end
%display(tmax);
vmax=tmax;
sig=0;
aa=0;bb=0;cc=0;
aa=(bri/bmax);
bb=(tex/tmax);
cc=20*(var/vmax);
sig=aa+bb+cc;
zeta=0;
zeta=papa/196608;
display(sig);
%display(papa);
display(zeta);


if(sig >= 4 && sig <= 25 && zeta < 0.5)
srcFiles = dir('dataset\1\*.jpg');
string1='dataset\1\';
elseif(sig >= 4 && sig <= 25 && zeta >= 0.5)
srcFiles = dir('dataset\2\*.jpg');
string1='dataset\2\';
elseif(sig<4)
srcFiles = dir('dataset\3\*.jpg');
string1='dataset\3\';
elseif(sig>25)
srcFiles = dir('dataset\4\*.jpg');
string1='dataset\4\';
end
pre=0.01;
t=370;
ps=zeros(1,20);
al=zeros(1,20);
a = 0;
b = 1;
c=0;
stego='hiddenmsgimage.png';
%display(stego);
fp = (b-a).*rand(1,1) + a;
%display(fp);
for i = 1 : length(srcFiles)
    filename = strcat(string1,srcFiles(i).name);
  %  display(filename);
    psnr=fuse(filename,fp,stego,c);
   % display(psnr);
     al(i)=fp;
     while(psnr>t)
      %   display('hello');
        fp=fp+pre;
       psnr=fuse(filename,fp,stego,c);
    %   display(psnr);
       al(i)=fp;
     end 
      while(psnr<t)
     %     display('hello');
        fp=fp-pre;
         al(i)=fp;
        psnr=fuse(filename,fp,stego,c);        
       %display(psnr);
      end

 end
display(al);

c=1;
for i = 1 : length(srcFiles)
    filename = strcat(string1,srcFiles(i).name);
    ps(i)=fuse(filename,al(i),stego,c);
end
display(ps);
max=0;in=0;
for i=1:1:20
    if(ps(i)>max)
        max=ps(i);
        in=i;
    end 
end    
display(in);
filename = strcat(string1,srcFiles(in).name);
display(filename);
psnr=fuse(filename,al(in),stego,c);



    