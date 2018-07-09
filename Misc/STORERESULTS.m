
InputDataStruct.conditions=conditions;

InputDataStruct.elapsed=elapsed;
InputDataStruct.LR=LR;
InputDataStruct.aware=aware;
InputDataStruct.responses=responses;
InputDataStruct.correct=correct;
InputDataStruct.rt=rt;


results=[conditions,rt',responses',aware',elapsed'];

dlmwrite(strcat('Data/',subname{1},'/',subname{1},'.txt'),results);

save(matfilename,'InputDataStruct')






