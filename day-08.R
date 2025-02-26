#Rachel Delorie, 2/24/2025, ESS 330 Exercise 8

library(tidyverse)
covid_data <- read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")

# step 2
df = data.frame(region = state.region, 
abbreviation = state.abb, state = state.name) %>% 
  inner_join(covid_data, df, by = "state") %>%  #step 3
  group_by(region, date) 

df %>% 
summarize(cases = sum(cases),
          deaths = sum(deaths)) %>% # step 4
  pivot_longer(cols = c(cases, deaths), # step 5
               names_to = "type",
               values_to = "count") %>% 
  ggplot(aes(x = date, y = count)) + # step 6
  geom_line() +
  facet_grid(type~region, scales = "free_y")+
  theme_bw()