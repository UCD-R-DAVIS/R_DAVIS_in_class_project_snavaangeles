library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
surveys_wide <- surveys %>% 
  group_by (genus,plot_type) %>% 
  filter(!is.na(hindfoot_length)) %>% 
  summarize(mean_hindfoot_length = mean (hindfoot_length)) %>% 
  pivot_wider(names_from = "plot_type", values_from = "mean_hindfoot_length") %>% 
  arrange (Control)

summary(surveys$weight)

weight_cat <- ifelse( surveys$ weight <= 20.00, "small")
                      ifelse (surveys$weight > 20.00 & surveys$weight < 48.00, "medium", 
                              "large")