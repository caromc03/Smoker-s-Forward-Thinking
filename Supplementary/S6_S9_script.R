# Qixiu Fu, April 2024

library(R.matlab) # read MATLAB data formats into R
library(lme4)

# Set current folder path
cpath = setwd('C:/Users/fuq01/Documents/GitHub/Smoker-s-Forward-Thinking/Supplementary')

# read data
mat_ids <- readMat("IDs.mat")
mat_delta <- readMat("deltas.mat")
mat_bis <- readMat("BIS.mat")
mat_bdi <- readMat("prolific_sds.mat")
mat_risk <- readMat("risk_aversion.mat")
mat_choice <- readMat("task_param.mat")
bis_df <- read.csv("online_bis.csv")
bdi_df <- read.csv("fmri_bdi.csv")

# data reformat for online sample
group <- c("healthy")
ID <- unlist(mat_ids$ID.healthy)
delta <- unlist(mat_delta$delta.h)
bdi <- unlist(mat_bdi$healthy.sds)
risk <- unlist(mat_risk$Risk.pref.healthy)
rr <- unlist(mat_choice$healthy.task[,1])
mid_rr <- unlist(mat_choice$healthy.task[,3])
df_hc <- data.frame(ID, group, delta, bdi, risk, rr, mid_rr)

group <- c("smoker")
ID <- unlist(mat_ids$ID.smok)
delta <- unlist(mat_delta$smok.delta)
bdi <- unlist(mat_bdi$smok.sds)
risk <- unlist(mat_risk$Risk.pref.smok)
rr <- unlist(mat_choice$s.task[,1])
mid_rr <- unlist(mat_choice$s.task[,3])
df_sm <- data.frame(ID, group, delta, bdi, risk, rr, mid_rr)

df_online = rbind(df_hc, df_sm)

# Regression models
################## S6A in-person Mood ###########################
# Delta ~ intercept + group (HC/smoker) + BDI (in-person) + group x BDI 
# (can't do interaction since there is no HC in-person BDI data)
fmri_bdi <- lm(data = bdi_df,
               formula = delta ~ BDI)
summary(fmri_bdi)
anova(fmri_bdi)

################## S6B online Mood ################################
# Delta ~ intercept + group (HC/smoker) + Zung (online) + group x Zung
online_delta <- lm(data = df_online, 
                 formula = delta ~ group + bdi + bdi*group,
                 control = lmerControl(optCtrl = list(maxfun = 1e6)))
summary(online_delta)
anova(online_delta)

################## S7 online BIS #############################
# Delta ~ intercept + group (HC/smoker) + BIS total(online) + group x BIS
online_bis <- lm(data = bis_df,
                 formula = delta ~ group + Total.BIS + group*Total.BIS)
summary(online_bis)
anova(online_bis)

################## S8 online risk aversion ################################
# Rejection rate (TOTAL OFFER)  ~ intercept + group + risk aversion + group x risk aversion
online_risk <- lm(data = df_online, 
                   formula = rr ~ group + risk + risk*group,
                   control = lmerControl(optCtrl = list(maxfun = 1e6)))
summary(online_risk)
anova(online_risk)

################## S9 online risk aversion ################################
# Rejection rate (medium OFFER)  ~ intercept + group + risk aversion + group x risk aversion
online_risk_mid <- lm(data = df_online, 
                  formula = mid_rr ~ group + risk + risk*group,
                  control = lmerControl(optCtrl = list(maxfun = 1e6)))
summary(online_risk_mid)
anova(online_risk_mid)