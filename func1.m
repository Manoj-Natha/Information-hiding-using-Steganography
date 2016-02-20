function z=func1(z,t,c,i,r,k)
    for j=1:2:c
            if(j==1)
            a=z;
            end
           
            avg=(a(i,j)+a(i,j+1))/2;
            %display(avg);
            dif=(a(i,j)-a(i,j+1))/2;
            %display(dif);
            z(i,k)=avg;
            z(i,t)=dif;
              k=k+1;
               t=t+1;
                
    end
   
            c=c/2;
            r=r/2;
            k=1;
            t=(r/2+1);
            if(c>1)
              z=func1(z,t,c,i,r,k);  
end 