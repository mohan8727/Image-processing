function [redout] = reduce(im)
    % Create kernel
    ker = generating_kernel(0.4);

    % Blur the image
    img_blur = imfilter(im, ker, 'conv');

    % Subsample
    rows = size(im,1);
    cols = size(im,2);

    % Get every other row
    img_blur_rows = img_blur(1:2:rows,:,:);

    % Now get every other column
    redout = img_blur_rows(:,1:2:cols,:);
end