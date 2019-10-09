function resultR = Label_Not_Straight(myImage)

    % Converting to greyscale
    myImageAsGray = rgb2gray(myImage);
    I_n_b = imadjust(myImageAsGray);
 
    % Extracting ROI for the top of the bottle label
    Horizontal_roi = Extracting_ROI(I_n_b, 170, 110, 195, 250);
    
    % Carrying out edge detection on ROI
    [~, thresh] = edge(Horizontal_roi, 'Sobel');
    Edge_roi = edge(Horizontal_roi, thresh*0.75);
    
    % Finding connected components & 'measurements' about each one
    connect_comp = bwconncomp(Edge_roi);
    measurements_cc = regionprops(connect_comp, 'BoundingBox'); 
    maximum_Width = 0; maximum_Height = 0;
   
    % Looping over all bounding boxes found
    for kk = 1 : length(measurements_cc)
        Bounding_B = measurements_cc(kk).BoundingBox;
        
        % Calculating the 'maximum_Width' of all bounding boxes
        if Bounding_B(3) > maximum_Width
            maximum_Width = Bounding_B(3);
        end
        
        % Calculating the 'maximum_Height' of all bounding boxes
        if Bounding_B(4) > maximum_Height
            maximum_Height = Bounding_B(4);
        end
    end
    
    % Extracting the ROI for the top half of the label
    Label_roi = Extracting_ROI(myImage, 180, 110, 230, 250);
    
    % Converting ROI to binary using a greyscale threshold of '50'
    Label_roi_Binary = imbinarize(Label_roi, double(50/256));
    
    % Calculating the % of black pixels in the ROI
    Percentage_black = 100 * (sum(Label_roi_Binary(:) == 0) / numel(Label_roi_Binary(:)));
    
    % Cond 1: Checking if (white) horizontal line (at the top of the label) is within limits
    horizontal_Result = maximum_Width <= 100 || maximum_Height >= 10;
    
    % Cond 2: Checking the # of black pixels on the label
    Percentage_Result_black = Percentage_black >= 13;
    
    resultR = horizontal_Result && Percentage_Result_black;
    
    
%     if result == 1
%      output = sprintf('oppsss….Label is not straight, ',result);
%      uiwait(helpdlg(output,'FAULT DETECTED'));
%    
%     end
    
end