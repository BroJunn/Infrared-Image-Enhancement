function gray_image = ensure_gray_image(image)
    if ndims(image) == 3
        gray_image = rgb2gray(image);
    else
        gray_image = image;
    end
end