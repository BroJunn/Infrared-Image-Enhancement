clear;
clc;

%% configs
l_prime = 100;
n_bins_hisequ = 240;
image_path = './imgs/small_3.jpg';

%% load image
input_image = imread(image_path);
input_image = ensure_gray_image(input_image);

%% main+vis
[enhanced_image, threshold] = enhance_infrared_image(input_image, l_prime, n_bins_hisequ);
display_images_with_parameters(input_image, enhanced_image, l_prime, threshold, n_bins_hisequ);