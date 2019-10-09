function resultR = Bottle_Overfilled(myImage)
   
    % Converting to greyscale
     myImage = rgb2gray(myImage);
    
         
% Iinitial = myImage;
% Igray    = rgb2gray(Iinitial);
% myImage        = imcomplement(myImage);
% Igray    = rgb2gray(myImage);
      
      
    % Extracting the ROI just over the ideal liquid level in the bottle
    r_o_i = Extracting_ROI(myImage, 110, 140, 140, 220);
    
    % Converting to a bin image using a greyscale threshold of '150' 
    roi_Binary = imbinarize(r_o_i, double(150/256));
    
    % Calculating the percentage of black pixels in the binary image
    Percentage_black = 100 * (sum(roi_Binary(:) == 0) / numel(roi_Binary(:)));

    %  if % black pixels is greater than 40% then Fault detected
    resultR = Percentage_black > 40; 
end
