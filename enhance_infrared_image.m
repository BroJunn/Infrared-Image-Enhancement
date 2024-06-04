function [enhanced_image, threshold] = enhance_infrared_image(input_image, l_prime, n_bins_hisequ)
    % Histogram equalization
    eq_image = histeq(input_image, n_bins_hisequ);

    % Otsu's method for finding the optimal threshold
    threshold = find_threshold(eq_image);

    % Segment the image into background and target regions
    background = eq_image <= threshold;
    target = eq_image > threshold;

    % Count valid gray levels and sort
    [sorted_bg_levels, sorted_target_levels] = sort_gray_levels(background, target, eq_image);

    % Equal-interval compression and stretching of gray levels
    enhanced_image = compress_and_stretch(eq_image, sorted_bg_levels, sorted_target_levels, l_prime);
end

