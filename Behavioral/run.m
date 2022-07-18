
% rawdata (beh matlab files)
load beh02_clean 

%% 2. Output file
outdir = '/Users/caro/Documents/MATLAB';
outfile = 'Beh_Results.mat';

%% 3. Summary of beh (M)
nP = length(A);
for i = 1:nP
    for c = 1:length(C)
        
        oo = A(i).(C{c}).R.offer; % responded offers        
        xLO = find(oo==1 | oo==2 | oo==3);
        xMO = find(oo==4 | oo==5 | oo==6);
        xHO = find(oo==7 | oo==8 | oo==9);

        ID{i,1} = A(i).ID;
        offer(i, c)  = mean(A(i).(C{c}).R.offer);
        rejR(i, c)   = 1 - mean(A(i).(C{c}).R.choice);
        rejR_L(i, c) = 1 - mean(A(i).(C{c}).R.choice(xLO));
        rejR_M(i, c) = 1 - mean(A(i).(C{c}).R.choice(xMO));
        rejR_H(i, c) = 1 - mean(A(i).(C{c}).R.choice(xHO));
        reward(i, c) = mean(A(i).(C{c}).R.reward);     
        pc(i, c)= nanmean(A(i).(C{c}).pc((A(i).(C{c}).pcAsked==1)));
    end
end

Mname = {'offer' 'rejR' 'rejR_L' 'rejR_M' 'rejR_H' 'reward' 'pc'};
M = [offer rejR rejR_L rejR_M rejR_H reward pc];
M_mean = mean(M(1:length(A), :));
M_std = std(M(1:length(A), :));

%% 5. Save
save(outfile, 'ID', 'Mname', 'M', 'M_mean', 'M_std');
