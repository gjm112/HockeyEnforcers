gen <- read.csv("/Users/gregorymatthews/Dropbox/HockeyEnforcersGit/JAMA NHL Data/General-Table 1.csv")
death <- read.csv("/Users/gregorymatthews/Dropbox/hockeyEnforcersGit/JAMA NHL Data/Deaths-Table 1.csv")

library(tidyverse)
gen$GP <- as.numeric(gsub(",","",gen$GP))
gen  <- gen %>% select(Player, DOB, Total.Fights, X1st.Season.Corrected, GP) %>% mutate(fperg  = Total.Fights/GP)
death <- death %>% select(Category, Enforcers, Date.of.Death)


dat <- gen %>% left_join(death, by = c("Player" = "Enforcers"))

dat$DOB <- as.Date(dat$DOB)
dat$Date.of.Death <- as.Date(dat$Date.of.Death, format = "%m/%d/%y")

dat$time <- dat$Date.of.Death - dat$DOB
dat$event <- 1
dat$event[is.na(dat$time)] <- 0

dat$time[dat$event == 0] <- as.Date("2022-07-06") - dat$DOB[dat$event == 0]

dat <- dat %>% filter(X1st.Season.Corrected >= 1967)

library(survival)
surv <- Surv(dat$time, dat$event)

library(ggsurvfit)
survfit(Surv(dat$time/365, dat$event) ~ 1) %>% 
  ggsurvfit() +
  labs(
    x = "Years",
    y = "Overall survival probability"
  )


coxph(Surv(dat$time, dat$event) ~ dat$fperg + dat$X1st.Season.Corrected)




