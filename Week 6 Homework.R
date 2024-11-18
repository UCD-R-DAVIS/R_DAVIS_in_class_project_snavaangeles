library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") 

#First calculates mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! 

gapminder_plot <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize (country_mean_life = mean(lifeExp) )

?ggplot

ggplot( data=gapminder_plot, mapping = aes(x = year, y = country_mean_life)) +
  geom_point(alpha = 1.0, aes(color = continent))

#Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code? 

#ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
#geom_point(aes(color = continent), size = .25) + 
 # scale_x_log10() +
  # geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  # theme_bw()
             
#ANSWER: I think scale_x_log10() is allowing for the graph to zoom in more in order to account for the larger economies. by taking the gdpPercapita to the 10th power.

#ANSWER: I think the geom_smooth line is creating a line to track the trend in gdp percapita and life expectancy

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + 
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.


countries <- c("Brazil", "China", "El Salvador", "Niger", "United States") 

gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 1)+
  theme_light() +
  ggtitle("Life Expectancy of Five Countries")
