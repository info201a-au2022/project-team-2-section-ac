# summary_info_script.R 
# A source file that takes in the football dataset and returns a list of info about it (at least 5 values):

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
View(results_df)

#creating the list that shows summary info 
summary_info <- list()

#1: number of games in the dataset 
summary_info$num_of_games <- nrow(results_df) - 1

#2: number of cities hosted 
summary_info$num_of_cities <- unique(results_df$city)

#3: number of countries hosted 
summary_info$num_of_countries <- unique(results_df$country)

#4: number of tournaments
summary_info$num_of_tournaments <- unique(results_df$tournament)

#5: games with a tie
summary_info$games_no_winner <- nrow(results_df %>% 
                                       filter(home_score == away_score))

#6: number of teams 
summary_info$num_of_teams <- unique(results_df$home_team)

#7: team with the highest home score of all time 
summary_info$team_most_home_scores <- results_df %>%
  filter(home_score == max(home_score)) %>% 
  pull(home_team)

#8: team with the highest away score of all time 
summary_info$team_most_away_scores <- results_df %>%
  filter(away_score == max(away_score)) %>% 
  pull(away_team)

