Screen('Preference', 'SkipSyncTests', 1);

addpath('Config'); 
addpath('Stim');
addpath('Trial');
addpath('Misc');

% IO stuff
Sbj_config

% Prepare the constants
Const_config

% Prepare the display
Scr_config

% Prepare the keys
Key_config

% Prepare the design
Design_config

% Prepare the stimuli.
Stim_config

% Prepare the text
Text_config

if oldsub==0
    % Set up empty vectors for responses.
    elapsed=zeros(1,length(conditions));
    LR=zeros(1,length(conditions));
    aware=zeros(1,length(conditions));
    responses=zeros(1,length(conditions));
    correct=zeros(1,length(conditions));
    rt=zeros(1,length(conditions));
    awResp=zeros(1,length(conditions));
else
    
    log_txt=sprintf(text.formatspecRestart,num2str(clock));
    fprintf(txtfilenamewrite,'%s\n',log_txt);
    
    elapsed=InputDataStruct.elapsed;
    LR=InputDataStruct.LR;
    aware=InputDataStruct.aware;
    responses=InputDataStruct.responses;
    correct=InputDataStruct.correct;
    rt=InputDataStruct.rt;
    awResp=InputDataStruct.awResp;
    
end
   


if istest==1
    numtrials=10;
else
    numtrials=length(conditions);
end

try
    
    whichscreen = max(Screen('Screens')); % count the screens
    [w, rect] = Screen('OpenWindow', whichscreen, [128,128,128]);
    
    
    frame = Screen('MakeTexture', w, surround);
    
    Make_textures
    
    Stim.F=Ftype;
    Stim.H=Htype;
    Stim.N=Ntype;
    Stim.A=Atype;
    
    
    Screen('TextSize',w,const.textsize);
    Screen('TextFont',w,'Arial Rounded MT Bold');
    
    Screen('DrawText',w,'press any key to begin',scr.rect_1(1),scr.rect_1(2),[255, 255, 255]);
    
    Screen('Flip', w);
    KbWait
    Screen('Flip', w);
    
    WaitSecs(1)
    
    for i = starttrial:numtrials

        
        
        RunTrial
        WaitSecs(randi(const.ITIlims)/10);
        InputDataStruct.trialsdone=i;
        
    end
    ShowCursor(1);
    Screen('CloseAll')
    
   
    if istest==1
        STORERESULTS
    else
        STORERESULTS
    end
    clear all
catch
    rethrow(lasterror)
    Screen('CloseAll')
    clear all
    
    
end









