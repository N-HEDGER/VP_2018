% GENCONDS


% EXP,INV,SL,PL.

% Define conditions. 
conditions=[1,1,1,1,1;1,1,1,2,2;1,1,2,1,3;1,1,2,2,4;....
    2,1,1,1,1;2,1,1,2,2;2,1,2,1,3;2,1,2,2,4;....
    1,2,1,1,1;1,2,1,2,2;1,2,2,1,3;1,2,2,2,4;....
    2,2,1,1,1;2,2,1,2,2;2,2,2,1,3;2,2,2,2,4;....
    1,3,1,1,1;1,3,1,2,2;1,3,2,1,3;1,3,2,2,4;....
    2,3,1,1,1;2,3,1,2,2;2,3,2,1,3;2,3,2,2,4;
    3,3,1,1,1;3,3,1,2,2;3,3,2,1,3;3,3,2,2,4];

% Define them seperately for masked and normal trials.
conditions2=horzcat(repmat(2,length(conditions),1),conditions);
conditions3=horzcat(repmat(3,length(conditions),1),conditions);

% Now for the CFS and masking trials, add some 'ghost' trials (where
% nothing is presented).

ghostprobe=[1,2]';
ghostprobe2=repmat(ghostprobe,14,1);
conditions5=horzcat(repmat(2,28,1),repmat(0,28,3),ghostprobe2,ghostprobe2);


conditions=vertcat(conditions2,conditions3,conditions5);

% Now randomise the condition matrix.
isfixed=0;
conditions=GenerateEventTable(conditions,1,isfixed);



% Method (1=CFS, 2=BM,3=CONC)
% Expression (1=Fear,2=Happy,3=Neutral.
% Inv(Upright, Inverted, Baseline)
% Stimulus location (1=left,2=right)
% Probe location (1=left,2=right)
% RT,VIS,


% 112 trials (repeat 4 times).