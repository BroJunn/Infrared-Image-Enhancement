function output = compress_and_stretch(image, bg_levels, target_levels, L_prime)

    k1 = numel(bg_levels);
    k2 = numel(target_levels);
    output = zeros(size(image), 'uint8');

    bg_interval = floor(L_prime / (k1 + 1));
    target_interval = floor((255 - L_prime) / (k2 + 1));

    for idx = 1:k1
        output(image == bg_levels(idx)) = (idx - 1) * bg_interval;
    end

    for idx = 1:k2
        output(image == target_levels(idx)) = L_prime + (idx - 1) * target_interval;
    end
end