function resultR = Bottle_Underfilled(myImage)

    % Converting to greyscale
     myImageAsGray = rgb2gray(myImage);
    
    
    % Extracting the ROI just under the ideal liquid level in the bottle
    r_o_i = Extracting_ROI(myImageAsGray, 130, 140, 170, 220);
    
    % Converting to a bin image using a greyscale threshold of '150' 
    roi_Binary = imbinarize(r_o_i, double(150/256));
    
    % Calculating the percentage of black pixels in the binary image
    Percentage_black = 100 * (sum(roi_Binary(:) == 0) / numel(roi_Binary(:)));

    %  if % black pixels is less than 25% then Fault detected
    resultR = Percentage_black < 25;
    
%     if result 
%      output = sprintf('Bottle Underfilled, ',result);
%      uiwait(helpdlg(output));
%     
%     end
    
   
end

