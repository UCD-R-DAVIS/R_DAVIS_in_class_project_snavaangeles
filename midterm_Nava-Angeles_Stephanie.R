library(tidyverse)
Tyler_Activity <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")
Tyler_Running <- 
  filter(Tyler_Activity, sport == "running" & minutes_per_mile < 10.00 & minutes_per_mile > 5.00) %>% 
  mutate (pace = case_when (
    minutes_per_mile < 6.0 ~ "fast", 
    minutes_per_mile > 6.0 & minutes_per_mile < 8.0 ~ "medium",
    T ~ "slow") , 
    form = case_when ( 
    year == 2024 ~ "new",
    T ~ "old"))

Tyler_Running %>% 
  select (steps_per_minute, pace, form) %>% 
  group_by(pace,form) %>% 
  summarize(Average_steps = mean(steps_per_minute)) %>% 
  arrange()

Tyler_Running %>% 
  summarize( )
