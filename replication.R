
library(dplyr)
library(MatchIt)

# read in data
gen_JAMA <- read.csv("C://Users//Leigh//OneDrive//Documents//LUC Documents//JAMA cleaning//General-Table 1.csv")
death_JAMA <- read.csv("C://Users//Leigh//OneDrive//Documents//LUC Documents//JAMA cleaning//Deaths-Table 1.csv")


# get original full sample
gen_JAMA %>% filter(X1st.Season.Corrected >= 1967) %>% nrow() 
  # 6039, matches paper exactly
original_sample = gen_JAMA %>% filter(X1st.Season.Corrected >= 1967)


# E-F Designation
gen_JAMA %>% filter(Total.Fights >= 50, X1st.Season.Corrected >= 1967) %>% nrow() #331, matches paper exactly
EF_cohort = gen_JAMA %>% filter(Total.Fights >= 50, X1st.Season.Corrected >= 1967)


# E-P Designation
gen_JAMA %>% filter(PIM.GP > 3, X1st.Season.Corrected >= 1967) %>% nrow() #183, matches paper exactly
EP_cohort = gen_JAMA %>% filter(PIM.GP > 3, X1st.Season.Corrected >= 1967)


# E-F Matching
EF_pop = original_sample %>% mutate(cohort = ifelse(Total.Fights>=50, TRUE, FALSE))
EF_match = matchit(cohort ~ DOB + GP + Ht + Wt + Pos, data = EF_pop, method = 'nearest', ratio = 1)
summary(EF_match)


# E-P Matching
EP_pop = original_sample %>% mutate(cohort = ifelse(PIM.GP > 3, TRUE, FALSE))

