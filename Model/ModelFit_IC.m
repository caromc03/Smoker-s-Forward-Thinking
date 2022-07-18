

%% load offer&resp data
load beh02_clean.mat 

nP = length(A);
OFFER = cell(nP,1);         % In control offers, responded trials only
RESP = cell(nP,1);          % In control offers, responded trials only


%% Trial 5-25
for i = 1:nP        
    trials = find(A(i).IC.R.xR>5 & A(i).IC.R.xR<26);
    OFFER{i,1} = A(i).IC.R.offer(trials);
    RESP{i,1} = A(i).IC.R.choice(trials);    
end

% Where the model scripts are
addpath(genpath('/Users/caro/Documents/MATLAB/zipalldat/social_controllability_fMRI-master/2.model'));

% Where to save the results
saveName = 'Modelfit_IC';


%% Model setting
Model = {'nRv_MF_t20_etaf'
         'nRv_f0_t20'
         'nRv_fD_cap2_t20_etaf'
         'nRv_f3_cap2_t20_etaf'
         'nRv_f4_cap2_t20_etaf'
         'nRv_f5_cap2_t20_etaf'};            % Candidate models { 'xx' ; 'xx'}
nM = length(Model);                          % nM = #candidate models

fixedName = {'norm0', 'norm_BS_k', 'delta_BS_k', 'eta'};
fixed = [10 4 4 0.8];

freeName = {'temp', 'envy', 'norm0', 'norm_RW_Adapt', 'delta', 'delta0', 'delta_RW_Adapt', 'eta', 'alpha'};
freeID = [1 1 1 1 0 0 0 0 1
          1 1 1 1 0 0 0 0 0
          1 1 1 1 1 0 0 0 0
          1 1 1 1 1 0 0 0 0
          1 1 1 1 1 0 0 0 0
          1 1 1 1 1 0 0 0 0
            ];        

nx = sum(freeID,2);       % # free param by model
[~, nX] = size(freeID);   % max # free param

BIC = zeros(nP, nM);                 % Calculate BIC
L =1000+BIC;                         % Calculate Likelihoods
X = zeros(nP, nX, nM);               % x (=free parameter) values returned by the optimization
param = X;


%% Free parameter starting points
free0 = cell(nM,1);
xIndex = cell(nM,1);
for m = 1:nM
    set = permn(-1:1,nx(m));   % permn(V,N) = permutations of N elements taken from the vector V, with repetitions
    free0{m} = zeros(length(set), nX);    
    xIndex{m} = find(freeID(m,:));
    free0{m}(:,xIndex{m}) = set;   
end  

errorPoint = [0 0 0];  


%% Model fitting
options =optimset('TolFun',10^(-4),'TolX',10^(-4),'Largescale','off', ...
      'DerivativeCheck','off','GradObj','off','MaxFunEvals',20000,'MaxIter',20000);
  
for i = 1:nP    
    
    offer = OFFER{i}; 
    resp = RESP{i};    
    nTr = length(offer);                       

     for m = 1:nM             
        ff = str2func(Model{m});                      

        for s =1:length(free0{m})                         
            index = [i m s];   
            if  ismember(index, errorPoint, 'rows')                       
            else
                x = free0{m}(s,:);                
                [x, Likeold, ~, ~, ~, ~] = fminunc(@(x) ff(offer,resp,fixed,x), x, options);
                if (L(i,m) > Likeold)
                    L(i,m) = Likeold;
                    X(i,:,m) = x;
                end
            end
        end        
        BIC(i,m) = L(i,m) + nx(m)/2*(log(nTr)-log(2*pi)); 
        param(i,xIndex{m},m) = 1./(1+exp(-X(i,xIndex{m},m)));
     end

end

%% Parameter Transformation
param(:,1,:) = 20*param(:,1,:);             % temp
param(:,3,:) = 20*param(:,3,:);             % norm0
param(:,5,3:6) = 4*param(:,5,3:6)-2;        % delta


%% Save the results
c = clock;
for i = 1:nP
    ID{i,1} = A(i).ID;
end
save(saveName, 'c', 'nM', 'Model', 'fixedName','fixed','freeName','freeID','free0', 'errorPoint', ...    
    'BIC','param', 'X', 'L', 'ID', 'options', 'OFFER', 'RESP'); 
clear;