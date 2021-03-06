% EXP,INV,SL,PL.
if oldsub==0
% Emotion bias trials
trialmat=nchoosek([1,2,3,1,2,3,1,2,3,1,2,3],4);
trialmat = unique(trialmat, 'rows');

trialmat=trialmat(trialmat(:,2)<3,:);
trialmat=trialmat(trialmat(:,3)<3,:);
trialmat=trialmat(trialmat(:,4)<3,:);

embiasnorm=horzcat(repmat(1,length(trialmat),1),trialmat,repmat(0,length(trialmat),1));
embiasmasks=horzcat(repmat(2,length(trialmat),1),trialmat,repmat(1,length(trialmat),1));
embiasmaskl=horzcat(repmat(2,length(trialmat),1),trialmat,repmat(2,length(trialmat),1));


% Face bias trials
trialmat=nchoosek([1,2,3,1,2,3,1,2,3,1,2,3],4);
trialmat = unique(trialmat, 'rows');

tempmat=trialmat;
tempmat=tempmat(tempmat(:,2)==3,:);

tempmat=tempmat(tempmat(:,3)<3,:);
tempmat=tempmat(tempmat(:,4)<3,:);


facebiasnorm=horzcat(repmat(1,length(tempmat),1),tempmat,repmat(0,length(tempmat),1));
facebiasmasks=horzcat(repmat(2,length(tempmat),1),tempmat,repmat(1,length(tempmat),1));
facebiasmaskl=horzcat(repmat(2,length(tempmat),1),tempmat,repmat(2,length(tempmat),1));

embiasmask=vertcat(embiasmasks,embiasmaskl);

facebiasmask=vertcat(facebiasmasks,facebiasmaskl);

embiasmask_ghost=embiasmask;
facebiasmask_ghost=facebiasmask;

embiasmask_ghost(:,2:3)=0;
facebiasmask_ghost(:,2:3)=0;


conditions=vertcat(embiasnorm,embiasmask,facebiasnorm,facebiasmask,embiasmask_ghost,facebiasmask_ghost);


conditions=GenerateEventTable(conditions,4,isfixed);


else
    conditions=InputDataStruct.conditions;
    
end

% 1)  = trialno
% 2) = Method (1=Norm, 2=BM)
% 3) = Expression (1=Fear,2=Happy, 3= anger).
% 4) Trialtype (Upright, Inverted, Baseline)
% 5) Stimulus location (1=left,2=right)
% 6) Probe location (1=left,2=right)
% 7) Model









