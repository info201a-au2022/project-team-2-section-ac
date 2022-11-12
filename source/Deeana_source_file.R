#source code for density map 
#question that graph acknowledges: Which National Teams has the most total wins from 1872-2022?
install.packages('tidyverse')
install.packages('dplyr')
install.packages('ggmap')
install.packages("ggplot2")
library(ggmap)
library(dplyr)
library(tidyverse)
library(plotly)


results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")


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

mapData <- total_goals_by_team


#world map set up code
WorldData=map_data("world")  #to take the world data
str(WorldData) #to see the structure of the world data
View(WorldData)
WorldData[WorldData == "USA"] <- "United States"
WorldData[WorldData == "China"] <- "China PR"
WorldData[WorldData == "Democratic Republic of the Congo"] <- "DR Congo"
Combined <- WorldData[mapData$team %in% mapData$team, ]
Combined$value <- mapData$total_goals[match(Combined$region, mapData$team)]

Countries <- unique(Combined$region)
CDF <- data.frame(label1=Countries)
for(i in CDF) {
  Combined$value <- ifelse(Combined$region %in% CDF$label1[i], 
                           (mapData$total_goals), Combined$team) 
}

#map aesthetics code
worldMap1 <- ggplot(Combined, aes(x=long, y= lat, group = group, fill = value)) +
  geom_polygon(color = 'white') +
  scale_fill_continuous(low = 'pale green', high = 'black', guide = 'colorbar') +
  theme_bw() +
  labs(fill = "Goals Scored", title = 'Density of Goals Scored by 
       National Football Teams (1872-2022)', x ='', y = '') +
  scale_y_continuous(breaks = c()) +
  scale_x_continuous(breaks = c()) +
  theme(panel.border = element_blank())


#interactive element code
ggplotly(worldMap1) %>%
  highlight(
    "plotly_hover",
    selected = attrs_selected(line = list(color = "black"), 
            )
  ) %>%
  widgetframe::frameWidget()


  

