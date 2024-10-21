function [ filtered ] = bilateralFilterColor( im,maskSize,sigmaC,sigmaS )
%BILATERALFILTER Summary of this function goes here
%   Detailed explanation goes here
msh = floor(maskSize/2);
[Y,X] = ndgrid(-msh:msh,-msh:msh);

closeness = (1./sqrt(2*pi*(sigmaC.^2))).*exp(-0.5.*(X.^2+Y.^2)./(sigmaC.^2));
filtered=zeros(size(im));

channels = size(im,3);

%uncomment for debugging
%figure()
for y=msh+1:size(im,1)-msh
    for x=msh+1:size(im,2)-msh
        
        % Mask pixels will contain the subregion of the image which is
        % inside the filter mask around point (x,y)
        maskPixels= im(y-msh:y+msh,x-msh:x+msh,:);
        
        % IntensityDifferencec contains the difference of the maskPixels'
        % intensities and the intesity at point (x,y)
        for c = 1:channels
            ColorDifferences(:,:,c)= maskPixels(:,:,c) - im(y,x,c);
        end
        intensityDifferences = sqrt(sum(ColorDifferences.^2,3));
        % Weight the Differences by a Gaussian
        similarity = (1./sqrt(2*pi*(sigmaS.^2))).*exp(-0.5.*(abs(intensityDifferences).^2)./(sigmaS.^2));
        
        % Compute the combined weight for each pixel inside the mask
        weights= closeness.*similarity;
        
        % Compute the new pixel intensity at the mask center
        filtered(y,x,:)= sum(sum(maskPixels.*repmat(weights,[1,1,channels])))/sum(sum(weights));
        
        %uncomment for debugging
%         subplot(2,2,1); imagesc(maskPixels);
%         title('image region inside the mask')
%         subplot(2,2,2); imshow(weights,[]);
%         title('similarity')
%         subplot(2,2,3); imshow(weights,[]);
%         title('final weights')
%         input('press Enter');
    end
end
        

end

