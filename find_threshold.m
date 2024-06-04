function threshold = find_threshold(image)
    % Initialize maximum variance value and best threshold
    max_variance = 0;
    best_threshold = 0;
    for T = 0:255
        w0 = sum(image(:) <= T) / numel(image);
        w1 = 1 - w0;
        mu0 = mean(image(image <= T));
        mu1 = mean(image(image > T));
        variance = w0 * w1 * (mu0 - mu1)^2;
        if variance > max_variance
            max_variance = variance;
            best_threshold = T;
        end
    end
    threshold = best_threshold;
end