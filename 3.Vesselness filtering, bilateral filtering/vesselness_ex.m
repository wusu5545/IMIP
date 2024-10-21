%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interventional Medical Image Processing (IMIP)
% SS 2014
% (C) University Erlangen-Nuremberg
% Author: Matthias Hoffmann & Yan Xia 
% Exercise 3.1
% Vesselness filtering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%parameters
nlevels=5;
sigma = 0.25;
threshLow = 25;
beta = 0.5;
c = 0.08;
border = 10;
fname = '01_test.tif';
fnameManual = '01_manual1.gif';
fnameMask = 'training_mask.gif';

%load input image
color = double(imread(fname));

%extract green channel
%???

%threshold background
img(img < threshLow) =threshLow;
img = img - threshLow;

%invert luminance
%???

%scale to [0;1]
%???


%load mask image mask
mask = double(imread(fnameMask));
%scale to [0;1]
%???

figure(1);
imagesc(img);
title('Input Image');
colormap('gray');

vesselnessPyr = zeros(size(img,1),size(img,2),nlevels);
vesselnessImg = zeros(size(img,1),size(img,2));

% go through 
for i=1:nlevels
    
    %smooth image, with gassian kernel, variable smoothed
    %???
    %???
    
    figure(2);
    subplot(2,3,i);
    imagesc(smoothed);
    title('Smoothed Image');
    colormap('gray');
    axis image;
    
    %compute second derivatives gxx,gxy,gyy
    %???
    %???
    %???
    
    %correct scale
    gxx = gxx* sigma^2;
    gxy = gxy* sigma^2;
    gyy = gyy* sigma^2;
    
   
    % go through image with border
    for x=border:size(img,2)-border
        for y=border:size(img,1)-border
            
            %build hessian H from gxx,gyy,gxy
            %???
            %???
            %???
            %???
            
            %compute eigenvalues of H lambda sorted by absolute value in ascending order
            %???
            %???
            %???
            
            %avoid numerical problems
            lambda(lambda==0) = eps;
            
            
            if lambda(2) > 0 || mask(y,x) ~= 1.0
                vesselnessPyr(y,x,i) = 0;
            else
                
                %calculate Rb
                %???
                
                %calculate S
                %???
                
                %compute Vesselness vess
                vess = exp(-(Rb^2/(2*beta^2)))*(1-exp(-(S^2/(2*c^2))));
                 
                vesselnessPyr(y,x,i) = vess;
                vesselnessImg(y,x) = max(vesselnessImg(y,x), vess);
            end
            
        end
    end
    
    %scale sigma for next level
    sigma = sigma*2;
    
    figure(3);
    subplot(2,3,i);
    imagesc(vesselnessPyr(:,:,i));
    title('Current Vesselness Image');
    colormap('gray');
    axis image;
    
end

%show combined vesselness image
figure(4);
imagesc(vesselnessImg);
title('Combined Vesselness Image');
colormap('gray');


%threshold image using fixed threshold
level = 0.005;
%???

figure(5);
imagesc(BW);
title('Thresholded Image');
colormap('gray');

%show manual segmentation
manual = double(imread(fnameManual));
figure(6);
imagesc(manual);
title('Manual Segmentation');
colormap('gray');


