
library(tidyverse)

Tyler_Laps <- read.csv ('https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv')

Tyler_Runs <- Tyler_Laps %>% 
  filter(sport == "running") %>% 
  filter(minutes_per_mile <10.00 & minutes_per_mile >5.00) %>% 
  mutate (Time_Period = case_when (year < 2024 ~ 'pre_2024',
                                   year == 2024 & month %in% 1:6 ~ 'rehab',
                                   year == 2024 & month %in% 7:12 ~ 'post_rehab'))

library(ggplot2)

ggplot(data = Tyler_Runs, mapping = aes (x = steps_per_minute, y = minutes_per_mile, color=Time_Period))+
  geom_smooth(alpha = 0.5) +
  xlab("SPM") +
  ylab("Speed by lap") + 
  theme_light() 

             