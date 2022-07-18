function indiv_nNPE_2blocks(varargin)

    data_dir = '/Users/caro/Documents/MATLAB/fMRI/UG_fMRI';
    output_dir = '/Users/caro/Documents/MATLAB/fMRI/6.normPE/Individual_GLM';
    event_dir = '/Users/caro/Documents/MATLAB/fMRI/1.Event';
    pmod_dir = '/Users/caro/Documents/MATLAB/fMRI/6.normPE/Parametric_Modulators/output';

    %% Update!
    pmod_name = 'nNPE'; % for v26 where 'pmod' has substructs with matching field names
    pmod_event = 1; % event_v1: 1=offer, 2=choice submitted, 3=outcome, 4=pc

    cd(data_dir)
    subdirs = dir('UG2*');

    for i= 1:length(subdirs)  % Be aware of the hidden files and folders
        subj{i} = subdirs(i).name;
    end

    % execute batch jobs
    for i= 12:length(subj) 

        data_path = fullfile(data_dir, subj{i});  
        output_path = fullfile(output_dir, subj{i});                  
        mkdir(output_path);

        cd(data_path)
        sw1 = dir('swar*UG1*.nii');
        sw1 = strcat(sw1.folder, '/', sw1.name);

        sw2 = dir('swar*UG2*.nii');
        sw2 = strcat(sw2.folder, '/', sw2.name);

        rp1 = dir('*UG1*.txt');
        rp1 = strcat(rp1.folder, '/', rp1.name);

        rp2 = dir('*UG2*.txt');
        rp2 = strcat(rp2.folder, '/', rp2.name);


        %% load event.mat and pmod.mat files
        load(fullfile(event_dir, strcat('event_', subj{i}, '.mat')));        
        load(fullfile(pmod_dir, strcat('pmod_', subj{i}, '.mat')));        


        %% run analysis           
        cd(output_dir);
        UG2_event_2blocks;


        cd ..
        clear matlabbatch;

    end
end