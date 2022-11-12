
library(dplyr)
library(tidyverse)
library(knitr)
results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")
View(results_df)


kable(results_df)
