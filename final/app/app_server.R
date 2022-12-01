library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)

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