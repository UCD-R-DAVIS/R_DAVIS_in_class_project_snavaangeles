library("tidyverse") 
Surveys <- read.csv("data/portal_data_joined.csv")
Surveys
str(Surveys)
select(Surveys, species_id, weight, plot_type)
Surveys2 <- select(Surveys, species_id, weight, plot_type)
Surveys2 [1:5000,]
remove(Surveys2)
Surveys3 <- Surveys[1:5000,c("species_id", "weight", "plot_type")]
Surveys3
as.factor("species_id")
Surveys3_Species_ID <- factor(Surveys3$species_id)
class(Surveys3_Species_ID)
Surveys3_Plot_Type <- factor(Surveys3$plot_type)
class(Surveys3_Plot_Type)
Survyes_NoNA <- Surveys3[!is.na("weight"),]
remove(Survyes_NoNA)
Surveys3[!is.na(Surveys3$weight),]

#A factor turns a character and tells r to interpret it as a number, they can be useful when we need to look at categorical data

challenge_base <- select(Surveys3$weight>150)
