
function [sorted_bg_levels, sorted_target_levels] = sort_gray_levels(bg_mask, target_mask, image)
    % Calculate the frequency of each gray level in the background and target regions
    [bg_freq, bg_edges] = histcounts(image(bg_mask), 'BinMethod', 'integers');
    [target_freq, target_edges] = histcounts(image(target_mask), 'BinMethod', 'integers');

    % Convert boundaries to center values
    bg_levels = bg_edges(1:end-1) + 0.5;  % Convert from boundaries to center
    target_levels = target_edges(1:end-1) + 0.5;  % Convert from boundaries to center

    % Keep only non-zero frequency gray levels
    valid_bg_indices = bg_freq > 0;
    valid_target_indices = target_freq > 0;
    bg_levels = bg_levels(valid_bg_indices);
    target_levels = target_levels(valid_target_indices);
    bg_freq = bg_freq(valid_bg_indices);
    target_freq = target_freq(valid_target_indices);

    % Sort gray levels in descending order based on frequency
    [bg_freq, bg_indices] = sort(bg_freq, 'descend');
    sorted_bg_levels = bg_levels(bg_indices);

    [target_freq, target_indices] = sort(target_freq, 'descend');
    sorted_target_levels = target_levels(target_indices);
end