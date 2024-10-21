im=im2double((imread('hochhaus.jpg')));
masksize=11;
sigmaC=1:2:5;
sigmaS=0.2:0.25:0.7;

figure()
for s=1:length(sigmaS)
    for c=1:length(sigmaC)
        subplot(length(sigmaC),length(sigmaS),(c-1)*length(sigmaS)+s);
        imshow(bilateralFilterColor(im,masksize,sigmaC(c),sigmaS(s)));
        title(sprintf('sigmaC:%0.3g sigmaS:%0.3g',sigmaC(c),sigmaS(s)));
    end
end

