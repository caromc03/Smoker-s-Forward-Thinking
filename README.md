# Scripts for "Aberrant Forward Thinking and its Neural Underpinnings in Nicotine-Dependent Human Smokers" 

Caroline McLaughlin, Soojung Na, Matthew Heflin, Vincenzo Fiore, Xiaosi Gu

## I. SYSTEM REQUIREMENTS AND INSTALLATION GUIDE

Verify that version 9.5 (R2018b) of the MATLAB Runtime is installed or find its location by entering >>mcrinstaller in the MATLAB prompt.  

Alternatively, download and install the Windows version of the [MATLAB Runtime for R2018b](http://www.mathworks.com/products/compiler/mcr/index.html)

Download and install [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/download/)

## II. REPRODUCTION INSTRUCTIONS 

* MATLAB and complied files are available here 
* Expected run time: Most scripts will take less than an hour to run. The longest scripts (Individual GLM on fMRI data & model fitting scripts) are expected to run for less than 2 days. 

## 1. Behavioral Results (Figure 2)
1.1 Open ["run.m"](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Behavioral/run.m)

1.2 For nicotine smokers' behavioral data input ["smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) and for matched non-smokers' behavioral data input ["nonsmok_beh.mat"](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 3)

1.3 Update input and ouput directories (lines 6,7) and run the script. 

1.4 "Results.mat" will be generated with the following variables: 
    * **"ID"**: Participant's ids 
    * **"Mname"**: Eight labels (strings) corresponding to each column pair in "M"
            * The first column corresponds to the modified Ultimatum Game block ("controllable condition") 
            * The second column corresponds to the typical Ultimatum Game block ("uncontrollable condition") 
    * **"M"**: Behavioral measures for each participant, each row corresponds to a different participant in same order as "ID" 
            * 'offer': Mean offer across the trials 
            * 'rejR': Mean rejection rate
            * 'rejR_L': Mean rejection rate for low offers ($1-3)
            * 'rejR_M': Mean rejection rate for medium offers ($4-6)
            * 'rejR_H': Mean rejection rate for high offers ($7-9)
            * 'reward': Mean reward
            * 'pc': Mean ratings of perceived controllability of the offers
    * **"M_mean"**: Mean behavioral measure across participants
    * **"M_std"**: Standard deviation for behavioral measures listed in "M" 
            
## 2. Model Fitting (Figure 3) 
 2.1 Open ["ModelFit_IC_.m"](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Model/ModelFit_IC.m) 
 
 2.2 For nicotine smokers' behavioral data input ["smok_beh.mat](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/smok_beh.mat) and for matched non-smokers' behavioral data input ["nonsmok_beh.mat"](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Data/nonsmok_beh.mat) (line 2)
 
 2.3 Update input and ouput directories (lines 17,20) and run the script. 
            * Models are found in in [LikelihoodFunctions](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/LikelihoodFunctions)  
 
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
            * Rows correspond to each particiant		
    * **"freeName"**: Parameter names
    * **"freeID"**: Indicates which parameters are free (1) or not used/fixed (0)
            * Columns correspond to parameters labeld in "freeName"
            * Rows correspond to models used 		
    * **"param"**: Parameter estimates
            * Columns correspond to each parameter listed in "freeName"
            * Rows correspond to each participants
            * The 3rd dimension corresponds each model
            
## 3. Parameter Recovery and Accuracy 
3.1 Open [recover_f3_IC](https://github.com/caromc03/Smoker-s-Forward-Thinking/blob/main/Model/Model%20Recovery/recover_MF_IC.m) for the 2-step model "controllable condition". Scripts for [other models](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/Model%20Recovery) and the ["Uncontrollable"](https://github.com/caromc03/Smoker-s-Forward-Thinking/tree/main/Model/Model%20Recovery/Uncontrollable) condition are also available.  

3.2 Update input and ouput directories (lines 6, 7) and run the script.

3.3. 



















            
            
            
            
            
            
            