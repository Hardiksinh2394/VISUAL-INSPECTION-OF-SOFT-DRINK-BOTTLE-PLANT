function resultR = Bottle_Deformed(myImage)

    %myImage = imread('deformedbottle-image001.jpg');
    % Converting to greyscale
    myImageAsGray = rgb2gray(myImage);
    %R =  myImageAsGray(:, :, 1);
    I_n_b = imadjust(myImageAsGray);
 
    % Extract the ROI for the top of the bottle label
   % roi_R = ExtractROI(I_n_b, 170, 110, 195, 250);
    
    
    % Extracting ROI of the label area on the bottle
    roi_R = Extracting_ROI(I_n_b, 190, 100, 280, 260);

    % Binarizing red channel using a greyscale threshold of '200'
    R_mask = imbinarize(roi_R, double(200/256));
   % subplot(121), imshow(maskR);
    
    % Finding bounding boxes surrounding connected components in the mask
    connected_comp = bwconncomp(R_mask, 4);
    measurements_cc = regionprops(connected_comp, 'BoundingBox');
    
    maximum_Area = 0; maximum_Area_W = 0;
   
    % Looping over all bounding boxes discovered
    for k = 1 : length(measurements_cc)
        Bounding_B = measurements_cc(k).BoundingBox;
        Bounding_B_Area = Bounding_B(3)*Bounding_B(4);
        
        % Finding bounding box with the largest area
        if Bounding_B_Area > maximum_Area
            maximum_Area = Bounding_B_Area;
            maximum_Area_W = Bounding_B(3);
            maximum_Area_H = Bounding_B(4);
        end
    end
    
    % Ensuring the area, width and height are within defined limits
    maximum_Area_Result = (maximum_Area >= 9800) && (maximum_Area <= 12000);
    maximum_Area_WResult = (maximum_Area_W >= 110) && (maximum_Area_W <= 130);
    maximum_Area_HResult = (maximum_Area_H >= 80) && (maximum_Area_H <= 100);
    
    % Bottle is deformed, if all these are unsatisfied
    resultR = ~(maximum_Area_Result && maximum_Area_WResult && maximum_Area_HResult);
    
%      if result
%      output = sprintf('oppsss….Bottle is deformed',result);
%      uiwait(helpdlg(output,'FAULT DETECTED'));
%    
%     end
end
