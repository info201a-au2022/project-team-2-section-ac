#source code for density map 
#question that graph acknowledges: Which National Teams has the most total wins from 1872-2022?
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggmap')
library(ggmap)
library(dplyr)
library(tidyverse)

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
View(results_df)

new_df <- data.frame(results_df$home_team, results_df$home_score, 
                    results_df$away_team, results_df$away_score)
#check: silesa = 24 total home goals
#creates data frame with only the count of home goals for each team 
home <- new_df %>% 
  rename(score = results_df.home_score) %>% 
  rename(team = results_df.home_team) %>%
  group_by(team,score) %>%
  aggregate(score ~ team, sum)


#check: abkhazia should have 12 away goals
#creates df with only count of away goals for each team 
away <- new_df %>% 
  rename(score = results_df.away_score) %>% 
  rename(team = results_df.away_team) %>% 
  group_by(team, score) %>% 
  aggregate(score ~ team, sum)

#combining the away goal and home goal data frame into one large df
df <- merge(home, away, by = 'team')

#new data frame that has sum of goals (both away and home) for each team.
total_goals_by_team <- df %>% 
  rename(home.goals = score.x) %>% 
  rename(away.goals = score.y) %>% 
  mutate(total_goals = home.goals + away.goals)
  
  

