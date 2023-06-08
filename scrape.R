gen_JAMA <- read.csv("C://Users//Leigh//OneDrive//Documents//LUC Documents//JAMA cleaning//General-Table 1.csv")
death_JAMA <- read.csv("C://Users//Leigh//OneDrive//Documents//LUC Documents//JAMA cleaning//Deaths-Table 1.csv")

#This is the number they get in the paper.  
gen_JAMA %>% filter(X1st.Season.Corrected >= 1967) %>% nrow()
# library(XML)
# library(RCurl)
# deaths <- list()
# year <- "2023"
# for (year in 1918:2023){print(year)
# Sys.sleep(10)
# tt <- getURL(paste0("https://www.hockey-reference.com/leagues/NHL_",year,"_deaths.html"))
# deaths[[year]] <- readHTMLTable(tt)$deaths
# }
"https://www.hockey-reference.com/leagues/NHL_2019_deaths.html"



#dead <- do.call(rbind, deaths)
#write.csv(dead, file = "/Users/gregorymatthews/Dropbox/hockeyEnforcers/deaths.csv")
dead <- read.csv("C://Users//Leigh//OneDrive//Documents//LUC Documents//JAMA cleaning//deaths.csv")
dead <- dead %>% filter(From >= 1967 & Name != "Name")

table(dead$Name %in% gen_JAMA$Player)
dead[!dead$Name %in% gen_JAMA$Player,]


tomatch = data.frame(dead$Name[!dead$Name %in% gen_JAMA$Player])
library(dplyr)
library(stringr)


# Pelle Lindbergh -> that was his real name, no other spelling, not sure about this one
dead$Name[dead$Name == 'Lars-Erik SjÃ¶berg'] <- 'Lars Sjoberg'
dead$Name[dead$Name == 'BjÃ¸rn Skaare'] <- 'Bjorn Skaare'
dead$Name[dead$Name == 'Roger HÃ¤gglund'] <- 'Roger Hagglund'
dead$Name[dead$Name == 'Michel Larocque'] <- 'Mario Larocque' # matched by birth year
#	Fern Rivard -> Bob Rivard is in JAMA but the birthdays don't match, this is Fernand Joseph Rivard who is not in JAMA
dead$Name[dead$Name == 'Yanick DuprÃ©'] <- 'Yanick Dupre'
dead$Name[dead$Name == 'DuÅ¡an PaÅ¡ek'] <- 'Dusan Pasek'
# Roy Edwards -> this is Allan Roy Edwards (matched w/ google by birthday), not in JAMA
dead$Name[dead$Name == 'StÃ©phane Morin'] <- 'Stephane Morin'
dead$Name[dead$Name == 'Dmitri Tertyshny'] <- 'Dimitri Tertyshny'
# Garry Bauman -> Garry Glenwood Bauman, matched on google by birthday, not in JAMA under gary, Garry, Bauman, or Glenwood
dead$Name[dead$Name == 'GaÃ©tan Duchesne'] <- 'Gaetan Duchesne'
# Michel Plasse -> Michel Pierre Plasse, matched by birthday, not in JAMA under Michel, Pierre, or Plasse
# Chris Worthy -> Christopher John Worthy, matched by birthday, not in JAMA under last name Worthy or 'Christopher John'
dead$Name[dead$Name == 'Miroslav DvoÅ™Ã¡k'] <- 'Miroslav Dvorak'
# Wayne Stephenson -> Wayne Frederick Stephenson, matched by birthday, not in JAMA under Wayne or Frederick
dead$Name[dead$Name == 'Igor Vyazmikin'] <- 'Igor Viazmikin'
dead$Name[dead$Name == 'Rick Martin'] <- 'Richard Martin'
dead$Name[dead$Name == 'Karel RachÅ¯nek'] <- 'Karel Rachunek'
dead$Name[dead$Name == 'KÄrlis SkrastiÅ†Å¡'] <- 'Karlis Skrastins'
dead$Name[dead$Name == 'Josef VaÅ¡Ã­Äek'] <- 'Josef Vasicek'
dead$Name[dead$Name == 'Kaspars AstaÅ¡enko'] <- 'Kaspars Astashenko'
dead$Name[dead$Name == 'Jeff McDill'] <- 'Jeffrey McDill'
# Joe Junkin -> Joseph Brian Junkin, matched by birthday, last name not present in JAMA
# Andre Gill -> there is another player born in 84 with the same name but neither are in JAMA
# Seth Martin -> matched by birthday, didn't go by another name, not in JAMA
#	Don McLeod -> Donald Martin McLeod, matched by birthday, not in JAMA 
dead$Name[dead$Name == 'Greg Parks'] <- 'Gregory Parks'
# Ken Broderick -> Kenneth Lorne Broderick, matched by birthday, last name not in JAMA
# Don Caley -> Donald Thomas Caley, matched by birthday, last name not in JAMA
# Ed Dyck -> Edwin Paul 'Ed' Dyck, matched by birthday, NOT Henry Dyck who is only Dyck in JAMA
#	Sergei Mylnikov -> Sergei Aleksandrovich Mylnikov, matched by birthday, not in JAMA
dead$Name[dead$Name == 'Marek SvatoÅ¡'] <- 'Marek Svatos'
#Ray Emery -> Raymond Robert Emery, matched by birthday, last name not in JAMA
dead$Name[dead$Name == 'Bob Sullivan'] <- 'Robert Sullivan'
dead$Name[dead$Name == 'Denis DupÃ©rÃ©'] <- 'Denis Dupere'
#	Jim McLeod -> Jimmy McLeod, birthday doesn't match any McLeods in JAMA
dead$Name[dead$Name == 'Dmitri Nabokov'] <- 'Dimitri Nabokov'
# Jim Pettie -> James 'Seaweed' Pettie, matched by birthday, last name not in JAMA
#	Tony Esposito -> Anthony James "Tony O" Esposito, matched by birthday, not in JAMA
dead$Name[dead$Name == 'Miroslav FryÄer'] <- 'Miroslav Frycer'
# Gary Inness -> Gary George Inness, matched by birthday, last name not in JAMA
# Matiss Kivlenieks -> Matiss Kivlenieks, matched by birthday, not in JAMA
dead$Name[dead$Name == 'RenÃ© Robert'] <- 'Rene Robert'
# Ken Brown -> Kenneth Murray Brown, matched by birthday, not in JAMA
# Robbie Moore -> Robert David Moore, matched by birthday, not in JAMA
# Curt Ridley -> Charles Curtis Ridley, matched by birthday which is actually off by one day but def not Mike Ridley in JAMA
dead$Name[dead$Name == 'Greg Tebbutt'] <- 'Gregory Tebbutt'
#Mike Blake -> Michael Wilmer Blake, matched by birthday, not in JAMA
dead$Name[dead$Name == 'Petr KlÃ­ma'] <- 'Petr Klima'
dead$Name[dead$Name == 'BÃ¶rje Salming'] <- 'Borje Salming'

#gen_JAMA %>% filter(str_detect(Player, '')) %>% select(Player)




#death_JAMA$Enforcers[!death_JAMA$Enforcers %in% dead$Name]
#These names are amazing! : dead$Name[dead$Name %in% gen_JAMA$Player]
#Merge 
library(tidyverse)
gen_JAMA$GP <- as.numeric(gsub(",","",gen_JAMA$GP))
gen_JAMA$PIM <- as.numeric(gsub(",","",gen_JAMA$PIM))
dead$GP <- as.numeric(dead$GP)
dead$From <- as.numeric(dead$From)
dead$G <- as.numeric(dead$G)
gen_JAMA %>% filter(X1st.Season.Corrected >= 1967) %>% nrow()
dat <- gen_JAMA %>% filter(X1st.Season.Corrected >= 1967) %>% left_join(select(dead,Name,Birth.Date,Death.Date,GP),by = c("Player" = "Name" ))


dead$Name[!dead$Name %in% gen_JAMA$Player]


dat <- dat %>% mutate(dead = !is.na(Death.Date), 
                      DOB = as.Date(DOB), 
                      Death.Date = as.Date(Death.Date))
dat$Death.Date[!dat$dead] <- as.Date("2023-05-07")
dat$age <- (dat$Death.Date - dat$DOB)/365
dat$Ht <- as.numeric(dat$Ht)
dat$Wt <- as.numeric(dat$Wt)
dat$FperG <- dat$Total.Fights/dat$GP
dat$Pos <- as.factor(dat$Pos)
dat$Ctry2 <- dat$Ctry
dat$Ctry2[!dat$Ctry2 %in% c("FIN","CZE","RUS","SWE","USA","CAN")] <- "OTH" 
dat$Ctry2 <- as.factor(as.character(dat$Ctry2))

library(survival)
dat$Surv <- Surv(dat$age,dat$dead)
coxph(Surv ~ Total.Fights  + GP + Ht + Wt + DOB.Year + Pos , data = dat[dat$Total.Fights <= 100,])

km_fit <- survfit(Surv(dat$age,dat$dead) ~ 1)
plot(km_fit)

library(ggplot2)
ggplot(aes(x = Total.Fights, y = age, col = dead), data = dat[dat$Total.Fights <= 100,]) + geom_point() + geom_smooth()
dat %>% group_by(DOB.Year) %>% summarise(fperg = sum(Total.Fights)/sum(GP)) %>% ggplot(aes(x = DOB.Year, y = fperg)) + geom_point() + geom_smooth()
dat %>% group_by(X1st.Season.Corrected) %>% summarise(fperg = sum(Total.Fights)/sum(GP)) %>% ggplot(aes(x = X1st.Season.Corrected, y = fperg)) + geom_point() + geom_smooth()

ggplot(aes(x = Total.Fights, y = age, col = dead), data = dat[dat$Total.Fights <= 100,]) + geom_point() + geom_smooth()




