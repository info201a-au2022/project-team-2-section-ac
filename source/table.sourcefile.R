install.packages('tidyverse')
install.packages('dplyr')
install.packages('knitr')

library(dplyr)
library(tidyverse)
library(knitr)
results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
View(results_df)
library(results_df)

kable(results_df)
