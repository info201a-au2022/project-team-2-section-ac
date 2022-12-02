library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)
library(leaflet)

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")

away_wins_ratio_plot <- results_df %>%
  mutate(team = away_team) %>%
  mutate(year = paste(substr(date, 1, 3), "0", sep = "")) %>%
  group_by(year) %>%
  mutate(away_wins = (away_score > home_score)) %>% 
  summarize(away_games=n(), away_wins=sum(away_wins)) %>%
  mutate(ratio = (away_wins / away_games)) %>%
  mutate(location = "Away") %>%
  select(year, ratio, location)

home_wins_ratio_plot <- results_df %>% # I did the same thing as the above data but for the home wins ratio.
  mutate(team = home_team) %>%
  mutate(year = paste(substr(date, 1, 3), "0", sep = "")) %>%
  group_by(year) %>%
  mutate(home_wins = (away_score < home_score)) %>% 
  summarize(home_games=n(), home_wins=sum(home_wins)) %>%
  mutate(ratio = (home_wins / home_games)) %>%
  mutate(location = "Home") %>%
  select(year, ratio, location)

total_ratio_plot <- union(away_wins_ratio_plot, home_wins_ratio_plot)

server <- function(input, output) {
  
  output$total_ratio_plot <- renderPlot({
    
    ggplot(total_ratio_plot, 
           main = input$year, aes(x = year, y = ratio, fill = location)) + 
              geom_bar(stat = "identity", position = "dodge") + 
              scale_fill_manual(values = c("#00A36C", "darkgreen")) + 
              labs(title = "Home Wins vs. Away Wins")
  })
}

#Deeana's code
new_df <- data.frame(results_df$home_team, results_df$home_score, 
                     results_df$away_team, results_df$away_score)

home <- new_df %>% 
  rename(score = results_df.home_score) %>% 
  rename(team = results_df.home_team) %>%
  group_by(team,score) %>%
  aggregate(score ~ team, sum)
away <- new_df %>% 
  rename(score = results_df.away_score) %>% 
  rename(team = results_df.away_team) %>% 
  group_by(team, score) %>% 
  aggregate(score ~ team, sum)
df <- merge(home, away, by = 'team')
total_goals_by_team <- df %>% 
  rename(home.goals = score.x) %>% 
  rename(away.goals = score.y) %>% 
  mutate(total_goals = home.goals + away.goals)
mapData <- total_goals_by_team
WorldData=map_data("world")  #to take the world data
str(WorldData) #to see the structure of the world data
WorldData[WorldData == "USA"] <- "United States"
WorldData[WorldData == "China"] <- "China PR"
WorldData[WorldData == "Democratic Republic of the Congo"] <- "DR Congo"
Combined <- WorldData[mapData$team %in% mapData$team,]
Combined$value <- mapData$total_goals[match(Combined$region, mapData$team)]
Countries <- unique(Combined$region)
CDF <- data.frame(label1=Countries)
for(i in CDF) {
  Combined$value <- ifelse(Combined$region %in% CDF$label1[i], 
                           (mapData$total_goals), Combined$value) 
  
}

server <- function(input, output) {
  output$selectTeam <- renderUI({
    selectInput("team", "Select National Team", choices = unique(Combined$region))
  })

 plot <- reactive ({
   plotData <- Combined %>% 
   filter(region %in% input$team) 
  
   ggplot(plotData, aes(x=long, y= lat, group = group, fill= value)) +
     geom_polygon(color = 'white') +
     #scale_fill_continuous(low = 'pale green', high = 'black', guide = 'colorbar') +
     theme_bw() +
     labs(fill = 'Goals scored', title = 'Density of Goals Scored by 
       National Football Teams (1872-2022)', x ='', y = '') +
     scale_y_continuous(breaks = c()) +
     scale_x_continuous(breaks = c()) +
     theme(panel.border = element_blank()
   )
 })
 output$worldMap1 <- renderPlot({ 
   plot()
 })
 output$worldMap <- renderPlot({
   ggplot(Combined, aes(x=long, y= lat, group = group, fill = value)) +
     geom_polygon(color = 'white') +
     scale_fill_continuous(low = 'pale green', high = 'black', guide = 'colorbar') +
     theme_bw() +
     labs(fill = "Goals Scored", title = 'Density of Goals Scored by 
       National Football Teams (1872-2022)', x ='', y = '') +
     scale_y_continuous(breaks = c()) +
     scale_x_continuous(breaks = c()) +
     theme(panel.border = element_blank()
     )
 })
 outputOptions(output, "worldMap1", suspendWhenHidden = FALSE)
 outputOptions(output, "worldMap", suspendWhenHidden = FALSE)
}