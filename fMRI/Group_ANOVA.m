% ANOVA Test Smokers vs. Non-smokers
 outdir = '/Users/caro/Documents/MATLAB/Match_demo/fMRI/Prediction_error/2sample_ttest';

     output_dir = outdir; 

    %% set model - full factorial design
    matlabbatch{1}.spm.stats.factorial_design.dir = cellstr(output_dir);

matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(1).scans = {
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB2993.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3061.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3069.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3078.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3085.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3092.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3106.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3128.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3130.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3189.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3208.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3225.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3238.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3254.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3264.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3271.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3276.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3285.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3286.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3291.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3302.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3309.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB3313.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB2972.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/new_nonsmok/cnv_3TB2908.nii,1'
                                                                      };
%%
%%
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(2).scans = {
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_02_B8TRE.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_03_TCLEB.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_04_5CY7N.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_05_4NDCB.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_06_6P14H.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_07_Y263R.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_08_LAQ1L.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_09_F05PP.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_10_U86E0.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_11_SAF0L.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_12_BM1NG.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_13_PPY7Q.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_14_ATEKN.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_15_YDCUZ.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_16_UZ87K.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_17_JALA0.nii,1'
                                                                      '/Users/caro/Documents/MATLAB/Convert_dimension/NormPE/smok/nNPE_ic_UG2_NU_01_8MRFX.nii,1'
                                                                      };



        
    matlabbatch{1}.spm.stats.factorial_design.des.anovaw.dept = 1;  %For unpaired 
    matlabbatch{1}.spm.stats.factorial_design.des.anovaw.variance = 1;
    matlabbatch{1}.spm.stats.factorial_design.des.anovaw.gmsca = 0;
    matlabbatch{1}.spm.stats.factorial_design.des.anovaw.ancova = 0;            
    matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
    matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
      
    % estimate the model
    matlabbatch{2}.spm.stats.fmri_est.spmmat = cellstr([output_dir filesep 'SPM.mat']);
    matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1; 

    % set up the contrasts
    matlabbatch{3}.spm.stats.con.spmmat =  cellstr([output_dir filesep 'SPM.mat']);
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = ['NS-S'];
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.convec = [1 -1];
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
        
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = ['S-NS'];
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.convec = [-1 1];
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
    
    cd(output_dir);
    save 'batch_f2_smokers_vs_nonsmoskers' matlabbatch;
    spm_jobman('run',matlabbatch);
    clear matlabbatch;


clear;
