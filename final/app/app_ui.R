library(dplyr)
#library(shiny)
library(plotly)
library(ggplot2)

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")

# introduction_page <- tabPanel(
#   "Introduction",
#   p("This is the introduction for the soccer app.")
# )
# 
# nathans_page <- tabPanel(
#   "Nathan's Analysis",
#   p("This is the interactive graph for comparing two teams performance"),
# )

source('app_server.R')
deeanas_page <- tabPanel(
  "National Team's Goal Density",
    
   titlePanel("National Team's Goal Density"),
   sidebarLayout(      
     sidebarPanel(
       uiOutput("selectTeam")
       ),
     mainPanel(
       plotOutput(outputId = "worldMap1"),
       plotOutput(outputId = "worldMap"))
       
     )
   )

summary_page <- tabPanel(
  "Summary",
  titlePanel("Summary Takeaways"), 
  p("text")
)


shiras_page <- tabPanel(
    
    titlePanel("Home Goals vs. Away Goals"),
    
    sidebarLayout(      
      
      sidebarPanel(
        selectInput("year", "Year:", 
                    choices=total_ratio_plot$year),
        hr(),
        helpText("Data from International Football results.")
      ),
      
      mainPanel(
        plotOutput("total_ratio_plot")  
      )
      
    )
  )


report_page <- tabPanel(
  "Report Page",
  titlePanel("Report Page"),
  p("From looking at the", em("International Football Results from 1872 to 2022"), "results, we have made a lot of interesting discoveries. Firstly, we created a map visualization that revealed the number of goals scored per country. This goal density visualization allowed us to see a big picture overview of national teams’ performance. We figure that this type of analysis can help the national teams themselves, but also the players and supporters as they can be informed on the status of their team’s success. Secondly, we created a home goal vs. away goal bar chart over time. The bar chart helped prove the", em("home game advantage theory"), "-- a theory that states that teams that play a match in their home city are more likely to win than teams that play a match away, at a city they are not from. We figure that this type of analysis can help team managers and coaches that are worried that the home game advantage may no longer serve them; they can refer to this analysis and see that when they play home, they will be much more likely to win, and therefore need to prepare their teams when they play away. Lastly, we created a line graph analysis of two teams -- Scotland and England -- to show how two teams can be compared and to inspire similar comparison analysis in the future. We figure this type of information can help coaches, fans, and investors make decisions about which team to support financially. Overall, our project reveals the various and interesting ways that soccer data can be observed and analyzed.")
)

ui <- navbarPage("AC-2 Project", shiras_page, report_page, deeanas_page)