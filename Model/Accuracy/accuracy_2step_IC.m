%% IC
load('recover_nRv_f3_cap2_t20_etaf_IC.mat') 
for i = 1:length(RESP_IC);
    ca = (RESP_IC);
    match{i} = ca{i}' == Rsim_IC{i};
    accuracyRate(i,1) = sum(match{i}==1)/length(match{i});
end
ic.RESP = RESP_IC;
ic.Rsim = Rsim_IC;
ic.match = match;
ic.accuracyRate = accuracyRate;
ic.accuracyRate_mean = mean(ic.accuracyRate);

save('accuracy2step.mat', 'ic')