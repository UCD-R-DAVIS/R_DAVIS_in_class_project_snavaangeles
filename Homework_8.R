#Let’s look at some real data from Mauna Loa to try to format and plot. These meteorological data from Mauna Loa were collected every minute for the year 2001. This dataset has 459,769 observations for 9 different metrics of wind, humidity, barometric pressure, air temperature, and precipitation. Download this dataset here. Save it to your data/ folder. Alternatively, you can read the CSV directly from the R-DAVIS Github: mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

#Use the README file associated with the Mauna Loa dataset to determine in what time zone the data are reported, and how missing values are reported in each column. With the mloa data.frame, remove observations with missing values in rel_humid, temp_C_2m, and windSpeed_m_s. Generate a column called “datetime” using the year, month, day, hour24, and min columns. Next, create a column called “datetimeLocal” that converts the datetime column to Pacific/Honolulu time (HINT: look at the lubridate function called with_tz()).

library(tidyverse)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

?tz

mloa_2 <- mloa %>% 
  filter(rel_humid != -99) %>% 
  filter (temp_C_2m != -999.9) %>% 
  filter (windSpeed_m_s != -999.9) %>% 
  mutate(datetime = ymd_hm (paste0(
    year,"-", 
    month, "-", 
    day," ", 
    hour24, ":", 
    min, 
    tz = "UTC"))) %>% 
  mutate (datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))

#Then, use dplyr to calculate the mean hourly temperature each month using the temp_C_2m column and the datetimeLocal columns. (HINT: Look at the lubridate functions called month() and hour()). Finally, make a ggplot scatterplot of the mean monthly temperature, with points colored by local hour.

mloa_2 