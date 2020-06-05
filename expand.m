function [expout] = expand(im)
    % Allocate memory for expansion
    rows = size(im, 1);
    cols = size(im, 2);
    expout = zeros([2*rows 2*cols 3]);

    % Interleave pixels
    %for i = 1 : rows
    %    % Grab i'th row
    %    im_row = im(i,:,:);
    %
    %    % Interleave row
    %    expout(2*i-1, 1:2:2*cols,:) = im_row;
    %end
    
    expout(1:2:2*rows,1:2:2*cols,:) = im;

    % Smooth the image
    ker = generating_kernel(0.4);
    expout = imfilter(expout, ker, 'conv');
    
    % Must scale by 4 to ensure that net weight contributing
    % to each output pixel is 1.
    expout = 4*expout;
end