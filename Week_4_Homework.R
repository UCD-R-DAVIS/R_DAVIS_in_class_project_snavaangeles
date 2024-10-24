library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

head ( filter(surveys, weight <60 & weight > 30))

biggest_critters <- surveys %>%
  filter(!is.na(sex) & !is.na(weight)) %>%
  group_by(species,sex) %>%
  summarize(max_weight = max(weight)) %>% 
  arrange()

biggest_critters

surveys %>%
  filter(is.na(weight)) %>%
  group_by(species) %>%
  tally()  %>%
  arrange()

surveys_avg_weight <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(species,sex) %>%
  mutate(average_weight_species_sex = mean(weight)) %>%
  select(species, sex, weight, average_weight_species_sex)

surveys_avg_weight <- surveys %>%
  filter(!is.na(weight)&!is.na(sex)) %>%
  group_by(species,sex) %>%
  mutate(average_weight_species_sex = mean(weight)) %>%
  select(species, sex, weight, average_weight_species_sex) %>%
  group_by(average_weight_species_sex,species,sex)%>%
  summarize ()

surveys_avg_weight%>%
  mutate(above_average = weight > average_weight_species_sex)

