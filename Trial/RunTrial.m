%% Show the frame and wait for the fixation duration

Screen('DrawTexture', w,frame, [], scr.frame_rect1);


firststimulus_onset=Screen('Flip', w,[],1);

WaitSecs(const.fixdur);



%% If it's a masking trial.

if conditions(i,2)==2
    
    
    
    %% If it's a 'ghost' trial.
    if conditions (i,4)==0
        log_txt=sprintf(text.formatspecGhost,i);
        fprintf(txtfilenamewrite,'%s\n',log_txt);
        
        % Just show nothing, then the mask.
        t0=GetSecs;
        Screen('DrawTexture', w,frame, [], scr.frame_rect1);
        [VBLTimestamp, StimulusOnsetTime, FlipTimestamp, Missed, Beampos] = Screen('Flip', w,[],[1],1);
        
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_1);
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_2);
        third_onset = Screen('Flip', w,[FlipTimestamp+const.maskdur(conditions(i,7))],[1],1);
        
        t1=GetSecs;
        elapsed(i)=t1-t0;
        
        %% If its a baseline trial
        
    elseif conditions (i,4)==3
        % Show a normal face on one side and a control on the other
        
        log_txt=sprintf(text.debugformat,i,text.preslabel{conditions(i,2)},text.expressionlabel{conditions(i,3)},text.trialtypelabel{conditions(i,4)},text.stimposlabel{conditions(i,5)},text.probeposlabel{conditions(i,6)},Model(i),const.maskdur(conditions(i,7)));

        fprintf(txtfilenamewrite,'%s\n',log_txt);
        
        Screen('DrawTexture', w, Stim.(structtype(i,:)){1,Model(i),const.contlevel}, [], pos(i,:));
        Screen('DrawTexture', w, Stim.(structtype(i,:)){2,Model(i),const.contlevel}, [], SCpos(i,:));
        
        
        [VBLTimestamp, StimulusOnsetTime, FlipTimestamp, Missed, Beampos] = Screen('Flip', w,[],[1],1);
        
        t0=GetSecs;
        
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_1);
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_2);
        
        
        third_onset = Screen('Flip', w,[FlipTimestamp+const.maskdur(conditions(i,7))],[1],1);
        t1=GetSecs;
        elapsed(i)=t1-t0;
        
        %% Otherwise it is an emotion bias trial.
        
    else
        log_txt=sprintf(text.debugformat,i,text.preslabel{conditions(i,2)},text.expressionlabel{conditions(i,3)},text.trialtypelabel{conditions(i,4)},text.stimposlabel{conditions(i,5)},text.probeposlabel{conditions(i,6)},Model(i),const.maskdur(conditions(i,7)));
       fprintf(txtfilenamewrite,'%s\n',log_txt);
        % Show a neutral face on one side and a emotional on the other
        
        t0=GetSecs;
        Screen('DrawTexture', w, Stim.(structtype(i,:)){conditions(i,4),Model(i),const.contlevel}, [], pos(i,:));
        Screen('DrawTexture', w, Stim.N{conditions(i,4),Model(i),const.contlevel}, [], SCpos(i,:));
        [VBLTimestamp, StimulusOnsetTime, FlipTimestamp, Missed, Beampos] = Screen('Flip', w,[],[1],1);
        
        t0=GetSecs;
        
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_1);
        Screen('DrawTexture', w, masks2{randi(20)}, [], scr.rect_2);
        
        third_onset = Screen('Flip', w,[FlipTimestamp+const.maskdur(conditions(i,7))],[1],1);
        t1=GetSecs;
        elapsed(i)=t1-t0;
        
    end
    
    
    %% If its a standard trial
    
elseif conditions(i,2)==1
        log_txt=sprintf(text.debugformat,i,text.preslabel{conditions(i,2)},text.expressionlabel{conditions(i,3)},text.trialtypelabel{conditions(i,4)},text.stimposlabel{conditions(i,5)},text.probeposlabel{conditions(i,6)},Model(i),0);
    fprintf(txtfilenamewrite,'%s\n',log_txt);
    %% If it's a baseline tial
    if conditions (i,4)==3
        t0=GetSecs;
        tic
        while toc<const.dur;
            
            Screen('DrawTexture', w, Stim.(structtype(i,:)){1,Model(i),const.contlevel}, [], pos(i,:));
            Screen('DrawTexture', w, Stim.(structtype(i,:)){2,Model(i),const.contlevel}, [], SCpos(i,:));
            
            third_onset = Screen('Flip', w,[],[1],1);
            
        end
        t1=GetSecs;
        
        elapsed(i)=t1-t0;
        
        %     all others
        
    else
        log_txt=sprintf(text.debugformat,i,text.preslabel{conditions(i,2)},text.expressionlabel{conditions(i,3)},text.trialtypelabel{conditions(i,4)},text.stimposlabel{conditions(i,5)},text.probeposlabel{conditions(i,6)},Model(i),0);
        fprintf(txtfilenamewrite,'%s\n',log_txt);
        %% If it's an emotion bias tial
        t0=GetSecs;
        tic
        while toc<const.dur;
            
            Screen('DrawTexture', w, Stim.(structtype(i,:)){conditions(i,4),Model(i),const.contlevel}, [], pos(i,:));
            Screen('DrawTexture', w, Stim.N{conditions(i,4),Model(i),const.contlevel}, [], SCpos(i,:));
            
           
            third_onset = Screen('Flip', w,[],[1],1);
        end
        t1=GetSecs;
        
        elapsed(i)=t1-t0;
        
        
        
    end
    
    
end


%% Now record some responses

third2_onset = Screen('Flip', w);

% Draw the dot
Screen('DrawTexture', w, frame, [], scr.frame_rect1);
Screen('DrawDots', w,Gpos(i,:),[const.dotsize],[], [], [3],[]);


Screen('Flip', w);

% Get the left/right response
t1=GetSecs;
[KeyIsDown,secs,keyCode]=KbCheck;
while keyCode(key.L)==0 && keyCode(key.R)==0
    [KeyisDown,secs,keyCode]=KbCheck;
end
rt(i)=secs-t1;

if keyCode(key.L)==1;
    responses(i)=1;
elseif keyCode(key.R)==1;
    responses(i)=2;
end


% % % % % % % % % % %


Screen('DrawTexture', w, frame, [], scr.frame_rect1);
Screen('DrawText',w,aw,scr.rect_1(1),scr.rect_1(2),[255, 255, 255]);
Screen('DrawText',w,num2str(i),scr.xf,scr.rect_1(2)+scr.STIMSIZEy);
Screen('DrawText',w,aw2,scr.rect_1(1),scr.rect_1(2)+100,[255, 255, 255]);
Screen('Flip', w, [],[1]);


% Get the aware/unaware response
[KeyIsDown,secs,keyCode]=KbCheck;
while keyCode(key.U)==0 && keyCode(key.D)==0 && keyCode(key.ESC)==0
    [KeyisDown,secs,keyCode]=KbCheck;
end


if keyCode(key.U)==1;
    aware(i)=1;
elseif keyCode(key.D)==1;
    aware(i)=0;
    
elseif keyCode(key.ESC)==1;
    
        log_txt=sprintf(text.formatSpecQuit,num2str(clock));
        fprintf(txtfilenamewrite,'%s\n',log_txt);
    
    STORERESULTS
    clear all
    sca
end


Screen('DrawTexture', w,frame, [], scr.frame_rect1);




ShowCursor;
    SetMouse(const.awrect(1), const.awrect(2), w);
    
    %     Define response range and rescale this to the 1-4 range.
    
    range=const.awrect(3)-const.awrect(1);
    rescaled=linspace(1,4,range);
    
    
    while 1
        %         Draw tickmarks
    vect=round(linspace(const.awrect(1),const.awrect(3),4));
    for tick=vect
        tick_offset = OffsetRect(const.tick, tick, const.awrect(2)-2);
        Screen('FillRect', w, const.rectColor, tick_offset);
    end
    
    %     Draw PAS labels and numbers.
    for txt=1:4
        DrawFormattedText(w, text.PASlabel{txt},vect(txt)-(0.3*(vect(2)-vect(1))), const.awrect(2)-150, WhiteIndex(w),[],[]);
        DrawFormattedText(w, num2str(txt),vect(txt), const.awrect(2)+40, WhiteIndex(w),[],[]);
    end
    
    %    Draw the response bar
    Screen('FillRect', w, const.rectColor, const.awrect);
    
    %     Get mouse position and determine whether or not it is in the bar.
    [mx, my, buttons] = GetMouse(w);
    inside_bar = IsInRect(mx, my+1, const.awrect);
    resprect = CenterRectOnPointd(const.selectRect, mx, const.awrect(2)+1);
   
    %    Draw slider at new location
    Screen('FillRect', w, const.blue, resprect);
    
    %    Mouse must be clicked, spacebar must be pressed and slider must be
    %    within response bar range.
   [KeyIsDown, endrt, KeyCode]=KbCheck;
   if KeyCode(key.space) && ismember(round(mx),const.awrect(1):const.awrect(3)) && sum(buttons) > 0
    awResp(i) = rescaled(round(mx)-const.awrect(1));
       break;
   end
   
   Screen('Flip', w);
   
           if sum(buttons) <= 0
                offsetSet = 0;
           end
           
          
    end

Screen('Flip', w);
Screen('DrawTexture', w,frame, [], scr.frame_rect1);
Screen('Flip', w);



STORERESULTS