# Scripts for "Aberrant Forward Thinking and its Neural Underpinnings in Nicotine-Dependent Human Smokers" 

Caroline McLaughlin, Soojung Na, Matthew Heflin, Vincenzo Fiore, Xiaosi Gu

## I. SYSTEM REQUIREMENTS AND INSTALLATION GUIDE

Verify that version 9.5 (R2018b) of the MATLAB Runtime is installed or find its location by entering "mcrinstaller" in the MATLAB prompt.  

Alternatively, download and install the Windows version of the [MATLAB Runtime for R2018b](http://www.mathworks.com/products/compiler/mcr/index.html)

Download and install [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/download/) and [MarsBaR toolbox](https://marsbar-toolbox.github.io/)

## II. REPRODUCTION INSTRUCTIONS 

* MATLAB and complied files are available here 
* Expected run time: Most scripts will take less than an hour to run. The longest scripts (Individual GLM on fMRI data & model fitting scripts) are expected to run for less than 2 days. 

## 1. Behavioral Results (Figure 2)
1.1 Open [run.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Behavioral/run.m)

1.2 Input nicotine smokers' behavioral data [smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) or matched non-smokers' behavioral data [nonsmok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 3)

1.3 Update input and output directories (lines 6,7) and run the script. 

1.4 "Results.mat" will be generated with the following variables:
* **"ID"**: Participants' ids 
* **"Mname"**: Eight labels (strings) corresponding to each column pair in "M"
    * The first column corresponds to the modified UG block ("controllable" condition) 
    * The second column corresponds to the typical UG block ("uncontrollable" condition) 
* **"M"**: Behavioral measures for each participant, each row corresponds to a different participant in the same order as "ID" 
    * 'offer': Mean offer across the trials 
    * 'rejR': Mean rejection rate
    * 'rejR_L': Mean rejection rate for low offers ($1-3)
    * 'rejR_M': Mean rejection rate for medium offers ($4-6)
    * 'rejR_H': Mean rejection rate for high offers ($7-9)
    * 'reward': Mean reward
    * 'pc': Mean ratings of perceived controllability of the offers
* **"M_mean"**: Mean behavioral measure across participants
* **"M_std"**: Standard deviation for behavioral measures listed in "M" 
            
## 2. Model Fitting (Figure 3) (Table 2)
 2.1 Open [ModelFit_IC.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Model/ModelFit_IC.m) 
 
 2.2 Input nicotine smokers' behavioral data [smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) or matched non-smokers' behavioral data [nonsmok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 2)
 
 2.3 Update input and output directories (lines 17,20) and run the script.
 * Models are found in in [LikelihoodFunctions](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/LikelihoodFunctions) folder  
 
 2.4 "ModelFit_IC_results" will be generated with the following: 
* **"Model"**: List of models used 
    * MF= Model-Free
    * f0= 0-step 
    * fD= 1-step
    * f3= 2-step
    * f4= 3-step
    * f5= 4-step
* **"BIC"**: BIC scores for each model 
    * Columns corresponds to listed models 
    * Rows correspond to each participant		
* **"freeName"**: Parameter names
* **"freeID"**: Indicates which parameters are free (1) or not used/fixed (0)
    * Columns correspond to parameters labeled in "freeName"
    * Rows correspond to models used 		
* **"param"**: Parameter estimates
    * Columns correspond to each parameter listed in "freeName"
    * Rows correspond to each participants
    * The 3rd dimension corresponds each model
            
## 3. Parameter Recovery and Accuracy (Tables S2 & S3 )
3.1 Open [recover_f3_IC](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Model/Model%20Recovery/recover_MF_IC.m) for the 2-step model "controllable" condition. Scripts for [other models](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/Model%20Recovery) and the ["uncontrollable"](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/Model%20Recovery/Uncontrollable) condition are also available.  

3.2 Update input and output directories (lines 6, 7) and run the script.

3.3. "recover_nRv_f3_cap2_t20_etaf_IC" will be generated with the following: 
* **"param_tru"**: Parameters estimated from the real data and used to generate new set of simulated choice data 		
* **"Rsim"**: Simulated choice data generated assuming "param_tru"
* **"param_est"**: parameter estimates for the simulated data
* **"R"**: correlation coefficient between "param_tru" and "param_est"
* **"P"**: p-value for correlation between "param_tru" and "param_est"

3.4 Open [accuracy_2step_IC.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Model/Accuracy/accuracy_2step_IC.m) 

3.5 Run script. The "ic" array structure generated includes:
* **"accuracyRate"**: matching rates between actual data and simulated data
* **"RESP"**: actual data 
* **"Rsim"**: simulated data 
* **accuracyRate_mean**: mean accuracy rate across participants  

## 5. Neural Signals: Forward Projected Choice Values and Norm Prediction Error (Figure 4)
### *Event Regressors for Individual GLM*  
* Open [event_v1.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/event_v1.m) 
* Load nicotine smokers' behavioral data [smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) or matched non-smokers' behavioral data [nonsmok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 14) 
* Update input and output directories (lines 3, 5) and run the script. 

### *Individual Parametric Modulators for Individual GLM* 
* Open [pmod_f2_nxV.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/pmod_f2_nxV.m) for choice values and [pmod_normPE.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/pmod_normPE.m) for norm PE
* Load nicotine smokers' behavioral data [smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) or matched non-smokers' behavioral data [nonsmok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 21) 
* Load ModelFit_IC_results & ModelFit_NC_results.  
* Update input and output directories and run the script.

### *Individual GLM* 
* Open [indiv_f2_nxV_2blocks](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/indiv_f2_nxV_2blocks.m) for choice values and [indiv_nNPE_2blocks.m](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/indiv_nNPE_2blocks.m) for norm PE 
* Update directories (lines 3-6) and run script  

### *Group GLM* 
* Open [group_f2_nxV_2block_IC](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/group_f2_nxV_2blocks_IC.m) for 2-step "controllable" condition. ["Uncontrollable"](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/group_f2_nxV_2blocks_NC.m) condition script is also available
* Update directories (lines 4-10) and run script 
* The script will generate a one-sample t-test results for the chosen action value coefficients at the group level
* Run a one-way between-subject ANOVA test for the whole-brain map for smokers and non-smokers by updating and running [Group_ANOVA](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/Group_ANOVA.m). 

### *Region of Interest* 
* Create a vmPFC or midbrain ROI mask using [makeROI_Feng](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/fMRI/makeROI_Feng.m). Update directories (lines 1,2) and input coordinate (line 11)
* Use marsbar toolbox to extract ROI coefficients. 
            