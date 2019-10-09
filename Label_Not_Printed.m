function resultR = Label_Not_Printed(myImage)
   
    % Converting to greyscale
    myImageAsGray = rgb2gray(myImage);
    
    % Extracting the ROI for the label
    r_o_i = Extracting_ROI(myImageAsGray, 180, 110, 280, 240);
    
    % Converting to a bin image using a grayscale threshold of '150' 
    roi_Binary = imbinarize(r_o_i, double(150/256));

    % Calculating the percentage of black pixels in the binary image
    Percentage_black = 100 * (sum(roi_Binary(:) == 0) / numel(roi_Binary(:)));
    
    % if % black pixels is less than 50% then Fault detected 
    resultR = Percentage_black < 50;
    
%     if result 
%      output = sprintf('oppsss….Label is not printed ',result);
%      uiwait(helpdlg(output,'FAULT DETECTED'));
%    
%     end
    
end