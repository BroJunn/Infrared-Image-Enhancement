function display_images_with_parameters(original_image, enhanced_image, L_prime, threshold, n_bins_hisequ)

    figure;
    
    % original image
    subplot(1, 2, 1);
    imshow(original_image);
    title(['original image, threshold' ' = ' num2str(threshold)]);
    
    % enhanced image
    subplot(1, 2, 2);
    imshow(enhanced_image);
    title(['enhanced image, L'' = ' num2str(L_prime) ', number of bins after balancing = ' num2str(n_bins_hisequ)]);
    
    % title
    sgtitle('comparison between original image and enhanced image');
end
