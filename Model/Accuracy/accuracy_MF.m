

%% IC
load('recover_nRV_MF_t20_etaf_IC.mat') %Rsim 48x1 cell
for i = 1:length(RESP_IC)
    ca = (RESP_IC);
    match{i} = ca{i}' == Rsim_IC{i};
    accuracyRate (1,i) = sum(match{i}==1)/length(match{i});
end
ic.RESP = RESP_IC;
ic.Rsim = Rsim;
ic.match = match;
ic.accuracyRate = accuracyRate;
ic.accuracyRate_mean = mean(ic.accuracyRate);

%% NC
load('recover_nRv_MF_t20_etaf_NC.mat') %Rsim 48x1 cell
for i = 1:length(RESP_NC)
    ica = (RESP_NC)';
    match{i} = ica{i}' == Rsim_NC{i};
    accuracyRate(1,i) = sum(match{i}==1)/length(match{i});
end
nc.RESP = RESP_NC;
nc.Rsim = Rsim;
nc.match = match;
nc.accuracyRate = accuracyRate;
nc.accuracyRate_mean = mean(nc.accuracyRate);

save('accuracy_MF.mat', 'ic', 'nc')