addpath(genpath('/Users/caro/Documents/MATLAB/spm12/toolbox/marsbar/marsbar-0.44'))
addpath('/Users/caro/Documents/MATLAB/fMRI/5.ROI')

outDir = cd; 
if ~isfolder(outDir)
    mkdir(outDir);
end

sphereRadius = 8; % mm

coords = [];

%coords = dlmread('200916_VS_independent.txt');

MakeRoi;

