library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") 


gapminder %>% 
  select (country, continent, year, pop) %>% 
  filter (year > 2001) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(population_change = (`2007` - `2002`)) %>% 
  ggplot(gapminder, mapping = aes( x = country, y = population_change)) +
  geom_col() +
  theme_bw()+
  facet_wrap( ~continent, scales = "free") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

  
