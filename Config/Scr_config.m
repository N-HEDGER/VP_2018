% Set some screen parameters
screenstruct=Screen('Resolution',(Screen('Screens')));
scr.width=screenstruct.width;
scr.height=screenstruct.height;
scr.DISPLAY_RECT=[0, scr.width, 0, scr.height];

% Horizontal extent of face/mask.
scr.STIMSIZEx=153;
% Vertical extent of face/mask.
scr.STIMSIZEy=230;
% Horizontal extent of frame.
scr.RectSIZEx=508;
% Vertical extent of frame.
scr.RectSIZEy=400;
% Seperation distance
scr.STIMSEP=235;


% Dummy rect for stimuli
scr.rect_0=[0,0,scr.STIMSIZEx,scr.STIMSIZEy];

% Dummy rect for frame
scr.frame_rect0=[0,0,scr.RectSIZEx,scr.RectSIZEy];

% Start by putting the frame rect in the middle of the screen
scr.frame_rect1=CenterRectOnPoint(scr.frame_rect0,scr.width/2,scr.height/2);

[scr.xf,scr.yf]=RectCenter([0, 0, scr.width, scr.height]);

% Offset the rects for the faces/ masks by the seperation distance.
scr.rect_1 = CenterRectOnPoint(scr.rect_0,scr.xf,scr.yf)-[scr.STIMSEP/2,0,scr.STIMSEP/2,0];

scr.rect_2 = CenterRectOnPoint(scr.rect_0,scr.xf,scr.yf)+[scr.STIMSEP/2,0,scr.STIMSEP/2,0];