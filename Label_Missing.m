function resultR = Label_Missing(myImage)
    
    % Converting to greyscale
     myImageAsGray = rgb2gray(myImage);
     
    % Extracting the ROI for the label
    r_o_i = Extracting_ROI(myImageAsGray, 180, 110, 280, 240);
    
    % Converting to a bin image using a greyscale threshold of '50' 
    roi_Binary = imbinarize(r_o_i, double(50/256));
    
    % Calculating the percentage of black pixels in the binary image
    Percentage_black = 100 * (sum(roi_Binary(:) == 0) / numel(roi_Binary(:)));
    
    % if % black pixels are greater than 50% then Fault detected
    resultR = Percentage_black > 50;
    
%     if result 
%      output = sprintf('oppsss….Label is missing',result);
%      uiwait(helpdlg(output,'FAULT DETECTED'));
%    
%     end
    
    
end
