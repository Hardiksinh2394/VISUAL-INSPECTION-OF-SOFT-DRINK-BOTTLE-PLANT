function resultR = Bottle_Cap_Missing(myImage)

    % Converting to greyscale
    myImageAsGray = rgb2gray(myImage);
    
    % Extracting ROI for bottle cap after converting into gray
    r_o_i = Extracting_ROI(myImageAsGray, 5, 150, 45, 200);
    
    % Converting to a bin image using a greyscale threshold of '150' 
    roi_Binary = imbinarize(r_o_i, double(150/256));

    % Calculating the percentage of black pixels in the binary image
    Percentage_black = 100 * (sum(roi_Binary(:) == 0) / numel(roi_Binary(:)));
    
    % if % black pixels are less than 25% then it's a fault
    resultR = Percentage_black < 25;
    
%      if result 
%      output = sprintf('Bottle cap missing',result);
%      uiwait(helpdlg(output));
%    else
%         output = myImage;
%     end
end