% Ask the participant whether or no this is a test (1=yes 0=no);
prompt='test[1=yes,0=no]';
istest=input(prompt);


% Run the GUI
InputDataStruct=RunExp;
nsub = InputDataStruct.nsub;
subname = InputDataStruct.subname;
subsex = InputDataStruct.subsex;
subage = InputDataStruct.subage;
nblock = InputDataStruct.nblock;
subnote = InputDataStruct.subnote;
isfixed = InputDataStruct.isfixed;
filename = InputDataStruct.filename;


matfilename=strcat('Data/',subname{1},'/',subname{1},'.mat');


if exist(matfilename) % If the filename exists, get rid of everything else.
    load(matfilename) % Load the file.
    trialsdone=InputDataStruct.trialsdone;
    X = [' You have done ',(num2str(trialsdone)),' trials']; % Display the number of trials done.
    disp(X)
    % Ask for response.
    Q1=input('That filename already exists. You have done the above number of trials,  correct [0= no, 1= yes]');
    if Q1==0
        % If incorrect, chose different initials.
        error('something has gone wrong. Please choose a different filename')
    else
        % If correct, proceed from the trial where the subject last finished.
        oldsub=1;
     starttrial=trialsdone;

     
    end
    
else % If the filename doesnt exist, then start at trial 1.
    oldsub=0;
    starttrial=1;
end





mkdir(strcat('Data/',subname{1}));

matfilename=strcat('Data/',subname{1},'/',subname{1},'.mat');
txtfilename=strcat('Data/',subname{1},'/',subname{1},'._log.txt');

txtfilenamewrite=fopen(txtfilename,'a+');