%both conditions together 
% pmod: (1) chosen value (xv), (2) norm violation (nv)
% Model: f3_cap2_t20_etaf

outdir = 'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\4.pmod\v26';
mkdir(outdir);
outfile = pmod_3TB0000.mat'; 

pmod = struct('name', [], 'block1', [], 'block2', []); 

pmod.name = ...
    {'chosenValue_z', ...
    'normViolation_z', ...
    }; %standarized z score 


% idmatch file (to convert from beh id to scan id)
load('idmatch.mat');

% for checking ID and order
load('smok_beh.mat');

%model directory
addpath(genpath('C:\Users\SN\Google Drive\z.functions\models'));
addpath 'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\2.model';


%% IC
load('Modelfit_IC_results.mat');

ID_ic = ID;

for i = 1:length(ID)
    [IC_chosenValue{i}, IC_normViolation{i}] = ...
        nRv_f3_cap2_t20_etaf_values(OFFER{i}, RESP{i}, fixed, X(i,:,4));        
end


%% NC
load('Modelfit_NC_results.mat');

ID_nc = ID;

for i = 1:length(ID)
    [NC_chosenValue{i}, NC_normViolation{i}] = ...  %outcomes function 
        nRv_f3_cap2_t20_etaf_values(OFFER{i}, RESP{i}, fixed, X(i,:,4)); %chosen values included given paramater        
end

%%  Assign values to pmod struct
for i = 1:length(A)  
    
    % Check if ID matches       
    if strcmp(ID_ic{i}, ID_nc{i})==0     
        disp('?')
        break
    end
    
    % beh ID -> scan ID    
    [~, idx] = ismember(ID{i}, idmatch(:, 1));  % vlookup
    id = idmatch{idx, 2};
        
    ic_nxV = normalize(IC_chosenValue{i}); %current+simulated utility of chosen action -accept or reject 
    nc_nxV = normalize(NC_chosenValue{i});
    
    ic_nNV = normalize(IC_normViolation{i}); %expected-observed 
    nc_nNV = normalize(NC_normViolation{i});
        
    if A(i).order == [1,2]    % IC first, NC second 

            pmod.block1.nxV = ic_nxV;
            pmod.block1.nNV = ic_nNV;            
            
            pmod.block2.nxV = nc_nxV;
            pmod.block2.nNV = nc_nNV;            

        elseif A(i).order == [2,1]    % NC first, IC second, counterbalance 
            
            pmod.block1.nxV = nc_nxV;
            pmod.block1.nNV = nc_nNV;            
            
            pmod.block2.nxV = ic_nxV;
            pmod.block2.nNV = ic_nNV;       %blocks nxv= chosen value nNv=norm valuation - standarized   

    end
    
    save(fullfile(['pmod_', id, '.mat']), 'pmod');
    
end
  clear;   
