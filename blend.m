function [blended_pyr] = blend(pyr_white, pyr_black, pyr_mask)
    blended_pyr = cell(1, length(pyr_white));
    for i = 1 : length(pyr_white)
        whiteImg = pyr_white{i};
        blackImg = pyr_black{i};
        maskPyr = pyr_mask{i};

        blended_pyr{i} = maskPyr.*whiteImg + (1-maskPyr).*blackImg;
    end
end