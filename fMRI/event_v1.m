event = struct('name', [], 'block1', [], 'block2', []); 

outdir = 'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\3.event\v1';
mkdir(outdir);
outfile = 'event_3TB0000.mat';

event.name = ...
    {'offerOnset', ...
    'choiceSubmission', ...
    'outcomeOnset', ...
    'perceivedcontrol'};  

% Responded trials file A
load ('smok_beh.mat')

% CREATE idmatch file to convert from behavioral to scan id 
load ('idmatch.mat'); 

subj = dir('UG2_*.mat'); %changes ID 

for i = 1:length(subj)
    
    % beh ID -> scan ID
    x = strsplit(subj(i).name, {'_', '.'}); %matching id's, split file name by - subj(i) name of file
    id_beh = x{4};
    [~, idx] = ismember(id_beh, idmatch(:, 1));  % vlookup, if have in match file
    id = idmatch{idx, 2}; %location of id 
   
    load(subj(i).name); %load raw data 
    
    % In control - responded trials
    Ric = A(i).IC.R.xR; 
    Ric = Ric(Ric>5 & Ric<26);  % 30 trials
    
    % No control - responded trials
    Rnc = A(i).NC.R.xR;
    Rnc = Rnc(Rnc>5 & Rnc<26);
    
    o_c = data_t(Ric, 4)';      %picks out responded trials 6-25        
    o_u = data_t(Rnc+30, 4)';   % offer onset

    c_c = data_t(Ric, 6)';             
    c_u = data_t(Rnc+30, 6)';   % choice submission

    r_c = data_t(Ric, 8)';              
    r_u = data_t(Rnc+30, 8)';   % outcome onset 

    p_c = data_t ([1,5,10,20,25,30],10)';      %perceived control 
    p_u = data_t ([31,35,40,50,55,60],10)';
    p_c= p_c(p_c>=0); %eliminate Nan values bcs all positive values 
    p_u= p_u(p_u>=0);
    
    triggerc = data_t(2,2);     % trigger of block 1
    triggeru = data_t(32,2);     % trigger of block 2
    
    ev_c = {o_c-triggerc; c_c-triggerc; r_c-triggerc; p_c-triggerc};    % in control condition events- deleted e_c
    ev_u = {o_u-triggeru; c_u-triggeru; r_u-triggeru; p_u-triggeru};    % no control condition events- deleted e_u
    
    if order == 1    % IC first, NC second
        
        event.block1 = ev_c;
        event.block2 = ev_u;
    
    elseif order == 2    % NC first, IC second
        
        event.block1 = ev_u;
        event.block2 = ev_c;      
    
    end
    
    order = cond; 
    save(fullfile(['event_', id, '.mat']), 'event', 'order');
    
end