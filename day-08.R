#Rachel Delorie, 2/24/2025, ESS 330 Exercise 8

library(tidyverse)
covid_data <- read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")

# step 2
df = data.frame(region = state.region, 
abbreviation = state.abb, state = state.name) %>% 
  left_join(covid_data, df, by = c("state" = "state")) #step 3

# step 4
