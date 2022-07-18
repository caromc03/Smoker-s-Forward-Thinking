% pmod (all normalized)
    % 1 nRT:  RT (normalized)
    % 2 nxV:  chosen value, total (normalized)
    % 3 nxCV: chosen value, current (normalized) 
    % 4 nxFV: chosen value, future (normalized)
    % 5 nO:   offer (normalized)
    % 6 nN0:   pre-norm (normalized)
    % 7 nN1:    post-norm (normalized)
    % 8 nNPE: norm prediction error (normalized)
    % 9 nNV:  norm violation (normalized)

% Model: f3_cap2_t20_etaf
%load('C:\Users\SN\Google Drive\p1.UG2_fMRI\210125_eLife_revision\rt\rt_clean.mat')
outdir = '/Users/caro/Documents/MATLAB/fMRI/6.normPE/Parametric_Modulators/output';
%mkdir(outdir);
% outfile = pmod_3TB0000.mat'

pmod = struct('name', [], 'block1', [], 'block2', []); 

pmod.name = ...
    {'nRT', 'nxV', 'nxCV', 'nxFV', 'nO', 'nN0', 'nN1', 'nNPE', 'nNV'};


% idmatch file (to convert from beh id to scan id)
load('idmatch.mat');

% for checking ID and order
load('beh02_clean.mat');

% model directory
%addpath(genpath('C:\Users\SN\Google Drive\z.functions\models'));
addpath '/Users/caro/Documents/MATLAB/fMRI/2.parametric modulators/LikelihoodFunctions';


%% IC
load('Modelfit_IC_results.mat');
OFFER_ic = OFFER;
RESP_ic = RESP;
fixed_ic = fixed;
X_ic = X;
ID_ic = ID;

%% NC
load('Modelfit_NC_results.mat');
OFFER_nc = OFFER;
RESP_nc = RESP;
fixed_nc = fixed;
X_nc = X;
ID_nc = ID;

% Check if ID matches       
if strcmp(ID_ic, ID_nc)==0
    disp('?')
end    


%%  Assign values to pmod struct
for i = 1:length(A)          
        
    % beh ID -> scan ID        
    [~, idx] = ismember(ID{i}, idmatch(:, 1));  % vlookup
    id = idmatch{idx, 2};
    
    [pmod_ic] = ...
    nRv_f3_cap2_t20_etaf_pmod_v31(OFFER_ic{i}, RESP_ic{i}, fixed_ic, X_ic(i,:,4));        

    [pmod_nc] = ...
    nRv_f3_cap2_t20_etaf_pmod_v31(OFFER_nc{i}, RESP_nc{i}, fixed_nc, X_nc(i,:,4));
    
    % RT
    %pmod_ic.nRT = normalize(pmod_rt_ic{i});
    %pmod_nc.nRT = normalize(pmod_rt_nc{i});
    
    if A(i).order == [1,2]    % IC first, NC second

            pmod.block1 = pmod_ic;
            pmod.block2 = pmod_nc;            

        elseif A(i).order == [2,1]    % NC first, IC second
            
            pmod.block1 = pmod_nc;
            pmod.block2 = pmod_ic;            
    end
        
    save(fullfile(outdir, ['pmod_', id, '.mat']), 'pmod');    
end
    
clear;