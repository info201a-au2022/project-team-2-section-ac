results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
install.packages("dplyr")
library("dplyr")

# I want to find the ratio of away wins:home wins and see which teams win more at home vs. which teams
# win more away. I will be ignoring ties (because a tie doesn't equal a win or loss). 

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
