library(dplyr)
#library(shiny)
library(plotly)
library(ggplot2)

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")

introduction_page <- tabPanel(
  "Introduction",
  p("This is the introduction for the soccer app.")
)

nathans_page <- tabPanel(
  "Nathan's Analysis",
  p("This is the interactive graph for comparing two teams performance"),
)

ui <- navbarPage("Title", introduction_page, nathans_page)