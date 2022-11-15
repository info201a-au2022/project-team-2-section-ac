#source code for comparing two teams performance

library(ggplot2)
library(dplyr)
library(tidyverse)
library("maps")


results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")


#I will be comparing Scotland and England
#First, I find the average score for Scotland across all their games (home and away)
scotland_home_scores <- results_df %>% 
  filter(home_team == "Scotland") %>% 
  pull(home_score) 
scotland_away_scores <- results_df %>% 
  filter(away_team == "Scotland") %>% 
  pull(away_score)

scotland_combined <- c(scotland_home_scores, scotland_away_scores)
scotland_avg_score <- mean(scotland_combined)

#Then, I do the same for England
england_home_scores <- results_df %>% 
  filter(home_team == "England") %>% 
  pull(home_score) 
england_away_scores <- results_df %>% 
  filter(away_team == "England") %>% 
  pull(away_score)

england_combined <- c(england_home_scores, england_away_scores)
england_avg_score <- mean(england_combined)









#Dataframe with all of Scotland's home/away games and the # of points scored
scotland_home_df <- results_df %>% 
  filter(home_team == "Scotland") %>% 
  mutate(team = home_team, score = home_score) %>% 
  filter(date > 2020-01-01) %>% 
  select(date, team, score)


scotland_away_df <- results_df %>% 
  filter(away_team == "Scotland") %>% 
  mutate(team = away_team, score = away_score) %>% 
  filter(date > 2020-01-01) %>% 
  select(date, team, score)


scotland_df <- rbind(scotland_home_df, scotland_away_df)


#Dataframe with all of England's home/away games and the # of points scored
england_home_df <- results_df %>% 
  filter(home_team == "England") %>% 
  mutate(team = home_team, score = home_score) %>% 
  filter(date > 2020-01-01) %>% 
  select(date, team, score)


england_away_df <- results_df %>% 
  filter(away_team == "England") %>% 
  mutate(team = away_team, score = away_score) %>% 
  filter(date > 2020-01-01) %>% 
  select(date, team, score)

england_df <- rbind(england_home_df, england_away_df)


#Line graph comparing # of points from England and Scotland over time
cases_plot <- ggplot() + 
  geom_line(data = scotland_df, mapping = aes(x= as.Date(date), y=score, color = 'Scotland')) +
  geom_line(data = england_df, mapping = aes(x = as.Date(date), y=score, color = 'England'), linetype = "twodash") +
  scale_color_manual(name = "Team", values = c("Scotland" = "blue", "England" = "red")) +
  labs(
    title = "Game scores of England vs Scotland from 2018-2022",
    x = "Year",
    y = "Score"
  ) 
  


