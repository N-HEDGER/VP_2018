function [ImOut]=Gabor2D(xysize,SAngle,Fcxi,PhGrad,sigx,sigy)

% function [ImOut]= Sinusoid2D(xysize,SAngle,Fcxi,sigma)
%
% The function return a Spatial (2-D) Gabor image(Filter)
% defined in space domain as follow
% g(x,y) = s(x,y) * wr(x,y)
% where s(x,y) is the sinusoid (called also the carrier)
% wr(x,y) is the gaussian window (called also envelope)
%
% the function return a 2-D Spatial Sinusoid
%
% INPUT: xysize is the number of pixels in the image
% SAngle is the spatial angle in degrees of the sinusoid
% 0 = vertical, 90 = horizontal
% Fcxi is the sinusoid frequency in cycles per image
% PhGrad is the phase of the sinusoid (in degrees).
% sigx is the variance in pixels for the Gaussian
% window on the x axis.
% sigy is the variance in pixels for the Gaussian
% window on the y axis.
% if not specify, sigy=sigx;
% OUTPUT ImOut the image of dimension xysize x xysize.
%
% Authors: Borgo, Soranzo, Grassi
% Date: 2009

if nargin==5
    sigy=sigx;
end

% Calculate the grid of point where calculate the image.
Bound=floor(xysize/2);
[x,y]=meshgrid(-Bound:Bound,-Bound:Bound);

% Calculate the Gabor image
S=Sinusoid2D(xysize,SAngle,PhGrad,Fcxi);
gaussEnv = exp(-((x/sigx).^2)-((y/sigy).^2));
ImOut=S.*gaussEnv;