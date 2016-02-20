    %s = imread('M4.png');
    s = imread('hiddenmsgimage.png');
    s=int16(s);
 
    height = size(s,1);
    width = size(s,2);
    m = s(1,1)*8;
    display(m);
    k = 1;
    for i = 1 : height
        for j = 1 : width
            if(i==1 && j==1)
                continue
            end   
            if (k <= m)
                b(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end
    display(b);
    binaryVector = b;
    % display(binaryVector);
    binValues = [ 128 64 32 16 8 4 2 1 ];
    %binaryVector = binaryVector(:);
    %display(binaryVector);
    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end
    binMatrix = reshape(binaryVector,8,(m/8));
  %  display(binMatrix);
    textString = char(binValues*binMatrix);    
    disp(textString);