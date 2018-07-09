% Read in masks
addpath('Stim');

surround=imread('RanDotSurround.bmp','bmp');
p = which('RMask1.jpg');

filelist = dir([fileparts(p) filesep 'RMask*.jpg']);

fileNames = {filelist.name}';
nimages=length(fileNames);

masks=cell(1,nimages);

parfor (k=1:nimages)
    I=rgb2gray(imread(fileNames{k}));
    masks{k}=imadjust(I,stretchlim(I),[]);
end

% Read in fear faces

p = which('fu1.jpg');
filelist = dir([fileparts(p) filesep 'fu*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

fups=cell(1,nimages);

parfor (k=1:nimages)
    fups{k}=imread(fileNames{k});
end


% Read in happy faces
p = which('hu1.jpg');
filelist = dir([fileparts(p) filesep 'hu*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

hups=cell(1,nimages);

parfor (k=1:nimages)
    hups{k}=imread(fileNames{k});
end

% Read in neutral faces
p = which('nu1.jpg');
filelist = dir([fileparts(p) filesep 'nu*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

nups=cell(1,nimages);

parfor (k=1:nimages)
    nups{k}=imread(fileNames{k});
end


% Inverteds

% Read in fear faces

p = which('fi1.jpg');
filelist = dir([fileparts(p) filesep 'fi*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

fips=cell(1,nimages);

parfor (k=1:nimages)
    fips{k}=imread(fileNames{k});
end


% Read in happy faces
p = which('hi1.jpg');
filelist = dir([fileparts(p) filesep 'hi*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

hips=cell(1,nimages);

parfor (k=1:nimages)
    hips{k}=imread(fileNames{k});
end

% Read in neutral faces
p = which('ni1.jpg');
filelist = dir([fileparts(p) filesep 'ni*.jpg']);
fileNames = {filelist.name}';
nimages=length(fileNames);

nips=cell(1,nimages);

parfor (k=1:nimages)
    nips{k}=imread(fileNames{k});
end


% Questions
aw='Signal or Noise?';
aw2='UP = Signal,DOWN = Noise';
aw3='WHICH SIDE: L OR R?';
tilt=' PROBE TILTED: L OR R?';
question= 'WHICH SIDE WAS THE IMAGE?';
question2='LEFT OR RIGHT?';
surround=imread('RanDotSurround.bmp','bmp');


% Based on the event table, make definitions for the stimuli.

% Side of the stimulus
 for k = 1:length(conditions);
 side(k)=conditions(k,5);
 
%  left
 if side(k)==1
     pos(k,:)=scr.rect_1;
 elseif side(k)==2
% right
   pos(k,:)=scr.rect_2;
 end
 end
 
 



%  side of the scramble
  for k = 1:length(conditions);
 SCside(k)=conditions(k,5);
 
 
 if SCside(k)==2
     SCpos(k,:)=scr.rect_1;
 elseif SCside(k)==1

   SCpos(k,:)=scr.rect_2;
 end
  end
 
  
 

[xrect1,yrect1]=RectCenter(scr.rect_1);
[xrect2,yrect2]=RectCenter(scr.rect_2);


 for k = 1:length(conditions)
 Gside(k)=conditions(k,6);
 
 
 if Gside(k)==1
     Gpos(k,:)=[xrect1,yrect1];
 elseif Gside(k)==2

   Gpos(k,:)=[xrect2,yrect2];
 end
 end
 

  
  
% Model
  for c = 1:length(conditions);
     Model(c)=conditions(c,7);
  end


%   Stim.
  for j=1:length(conditions)
struct(j)=conditions(j,3);
if struct(j)==1;
struct2type{j}='F';
elseif struct(j)==2;
struct2type{j}='H';
elseif struct(j)==3;
struct2type{j}='N';
elseif struct(j)==0;
struct2type{j}='G';
end;
end;
structtype=char(struct2type);







