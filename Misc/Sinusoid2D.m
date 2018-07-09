function [ImOut]=Sinusoid2D(xysize,SAngle,Fcxi,PhGrad)
 
% function [ImOut]= Sinusoid2D(xysize,SAngle,Fcxi,PhGrad))
%
% the function return a 2-D Spatial Sinusoid 
%
% INPUT:    xysize  is the vector containing the x per y dimension
%                   if it is a scalar a square image is created
%           SAngle  is the spatial angle in degree of the sinusoid
%                   0 = vertical, 90 = horizontal
%           Fcxi    is the sinusoid frequency in cycles per image
%           PhGrad  is the phase of the sinusoid (in degree).
% OUTPUT    ImOut   the image of dimension express by xysize.
%
% Authors: Borgo, Soranzo, Grassi
% Date: 2012
 
% Calculate the image grid.
Boundx=xysize(1);
if length(xysize) == 2
   Boundy=xysize(2);
else
   Boundy=Boundx;
end
[x,y]=meshgrid(1:Boundx, 1:Boundy);
 
% define the costant for the cosine 
wo=SAngle/180*pi;   % conversion from deg to rad
PhRad=PhGrad/180*pi;% conversion from deg to rad
f=Fcxi/xysize(1);   % frequency conversion
 
ax = f*cos(wo);    % convert the spatial frequency along y
by = f*sin(wo);    % convert the spatial frequency along x
 
% Calculate the Sinusoid 
%(+1 is to obtatin all values being more than 1)
ImOut=sin(2*pi*(ax*x+by*y)+PhRad)+1;