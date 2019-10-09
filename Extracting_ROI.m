function Image_Output = Extracting_ROI(Image_Input, yy1, xx1, yy2, xx2)
% extracting ROI (Region of Interest) from an image

% Checking if any of the points are '0'
if xx1 == 0 || xx2 == 0 || yy1 == 0 || yy2 == 0
    errorMessage = sprintf('[ERROR]: Ooops you forgot MATLAB indices starts at 1!\n');
    uiwait(warndlg(errorMessage));
    return;
end

% Get image dimensions
[height, width, ~] = size(Image_Input);

if xx1 > width || xx2 > width || yy1 > height || yy2 > height
    errorMessage = sprintf('[ERROR]: ooppsss...Images dimensions (%d, %d) exceeded!\n', height, width);
    uiwait(warndlg(errorMessage));
    return;
end

Image_Output = Image_Input(yy1:yy2, xx1:xx2, :);
end
