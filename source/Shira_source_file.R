results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
View(results_df)
install.packages("dplyr")
library("dplyr")

# I want to find the ratio of away wins:home wins and see which teams win more at home vs. which teams
# win more away. I will be ignoring ties (because a tie doesn't equal a win or loss). 

away_games_wins_ratio <- results_df %>%
  mutate(team = away_team) %>% # I changed the column name to make it clearer 
  group_by(team) %>%
  mutate(away_win = (away_score > home_score)) %>% # I added a new column that is TRUE when the away score is higher than the home score, meaning the away team won
  summarize(away_games=n(), away_wins=sum(away_win)) # I counted the total number of games and the total number of away wins

home_games_wins_ratio <- results_df %>% # I will now do the same function but for the home games
  mutate(team = home_team) %>%
  group_by(team) %>%
  mutate(home_win = (away_score < home_score)) %>%
  summarize(home_games=n(), home_wins=sum(home_win))

home_away_ratio <- full_join(away_games_wins_ratio, home_games_wins_ratio, by = c("team"), na.rm = 0) %>% # I need to join the columns to visualize both ratios together
  mutate(away_ratio = as.integer((away_wins / away_games) * 100)) %>% # I multiply by 100 to get a percentage 
  mutate(home_ratio = as.integer((home_wins / home_games) * 100)) %>%
  mutate(favorite = case_when(home_ratio > away_ratio ~ "Home", TRUE ~ "Away")) # I added a new column that shows whether the team favorites home or favorites away
  
# I found that all teams do better at Home instead of Away. I'll now find the teams with the most
# Away wins and the teams with the most Home wins.

highest_away_ratio <- home_away_ratio %>% # I continued wrangling the data to see what other relationships I could find. I saw that this didn't conclude to a meaningful visualization because the teams that have the highest win ratio also played the least amount of games.
  filter(away_ratio == max(away_ratio, na.rm = TRUE)) %>%
  select(team, away_ratio)

highest_home_ratio <- home_away_ratio %>%
  arrange(-home_ratio, -home_games)
  filter(home_ratio == max(home_ratio, na.rm = TRUE)) %>%
  select(team, home_ratio)
  
install.packages("ggplot2")
library("ggplot2")

away_wins_ratio <- results_df %>% # I decided to visualize the away win ratio by decade
  mutate(team = away_team) %>%
  mutate(year = paste(substr(date, 1, 3), "0", sep = "")) %>% # I changed the date to decade by selecting only the first 3 digits of the date and then adding a 0 at the end.
  group_by(year) %>%
  mutate(away_wins = (away_score > home_score)) %>% 
  summarize(away_games=n(), away_wins=sum(away_wins)) %>%
  mutate(away_ratio = (away_wins / away_games)) %>%
  select(year, away_ratio) # By selecting year and ratio, I can see the away win ratio per decade.

ggplot(away_wins_ratio, aes(x = year, y = away_ratio, group = 1)) + geom_bar(stat = "identity") # This created a bar graph for the above data.

home_wins_ratio <- results_df %>% # I did the same with the home wins ratio.
  mutate(team = home_team) %>%
  mutate(year = paste(substr(date, 1, 3), "0", sep = "")) %>%
  group_by(year) %>%
  mutate(home_wins = (away_score < home_score)) %>% 
  summarize(home_games=n(), home_wins=sum(home_wins)) %>%
  mutate(home_ratio = (home_wins / home_games)) %>%
  select(year, home_ratio)

ggplot(home_wins_ratio, aes(x = year, y = home_ratio, group = 1)) + geom_bar(stat = "identity") # This created a bar graph for the above data. I thought the individual bar graphs were boring so I combined them.

# The data below is very similar to the above data, except this time I was preparing the data for visualization so I called the away win ratio only "ratio" and created a new column called "Away" that I could then use in my key.
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

total_ratio_plot <- union(away_wins_ratio_plot, home_wins_ratio_plot) # I united the two data frames so I could plot them side by side.

# The data below created my side-by-side barplot that shows how the home advantage has existed for years; all teams have a much higher home win ratio than away win ratio.
ratio_barplot <- ggplot(total_ratio_plot, aes(x = year, y = ratio, fill = location)) + geom_bar(stat = "identity", position = "dodge") + scale_fill_manual(values = c("#00A36C", "darkgreen"))

install.packages("ggplot2")
library("ggplot2")
install.packages("dplyr")
library("dplyr")
