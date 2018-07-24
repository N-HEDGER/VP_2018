% Set some screen parameters
screenstruct=Screen('Resolution',(Screen('Screens')));
scr.width=screenstruct.width;
scr.height=screenstruct.height;


scr.x_mid = (scr.width/2.0);
scr.y_mid = (scr.height/2.0);
scr.mid = [scr.x_mid,scr.y_mid];


scr.DISPLAY_RECT=[0, 0, scr.width, scr.height];

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



const.stimctr=scr.mid;
const.stimbot=scr.height;
const.stimright=scr.width;

const.selectRect=[0 0 10 40];
const.slidebar_xsize=const.stimright/4;
const.slidebar_ysize=10;

const.progbar_xsize=const.stimright;
const.progbar_ysize=10;

const.slidebar_xPosition=const.stimctr(1)-const.slidebar_xsize;
const.slidebar_yPosition=const.stimbot*0.85;
const.baseBar =[0 0  const.slidebar_xsize  const.slidebar_ysize];
const.progBar =[0 0  const.progbar_xsize  const.progbar_ysize];

const.tick = [0 0 4 10];
const.rectColor=[200 200 200];
const.selectRect = [0 0 10 40];
const.blue=[0 0 200];

const.awrect=CenterRect(const.baseBar, scr.DISPLAY_RECT);


