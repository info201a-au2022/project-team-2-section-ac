#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)
library(maps)

#sourcing the two other files 
source("./app_ui.R", local = knitr::knit_global())
source("./app_server.R", local = knitr::knit_global())

# Run the application 
shinyApp(ui = ui, server = server)