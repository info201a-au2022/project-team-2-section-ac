library(dplyr)
#library(shiny)
library(plotly)
library(ggplot2)
library(maps)

results_df <- read.csv("https://raw.githubusercontent.com/martj42/international_results/master/results.csv")

introduction_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p("In this project, we pull data from the “International Football Results from 1872 to 2022” dataset, which provides information about different football teams’ performance over time, including which tournaments they played at, whether the game played was a home or away game, and the city / country the team is from. In the game of soccer, statistics and performance analysis is crucial to a team's success. Understanding an opponent's track record in games not only helps prepare strategies & tactics for upcoming tournaments, but also provides important insight towards team investors and soccer fans alike. In this application, we seek to provide valuable insight to key stakeholders by answering the following questions:"),
  tags$div(
    tags$ul(
      tags$li("Which national teams are more likely to win home vs away games (bar graph)?")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Which national teams has the most total wins from 1872-2022 (density map)?")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("What is the goal performance of X team compared to Y team (line graph)?")
    )
  ),
  p("Key insights revealed include whether teams perform better at home vs away games, which teams are the most historically commpetitive, and how the goal performance between two teams has changed throughout time."),
  img(src = "soccer_ball.webp", height = 300, width = 300)
)
 

source("./app_server.R")
deeanas_page <- tabPanel(
  "National Team's Goal Density",
   titlePanel("National Team's Goal Density"),
   sidebarLayout(      
     sidebarPanel(
       uiOutput("selectTeam")
       ),
     mainPanel(
       plotOutput(outputId = "worldMap1", height = 600, width = 600),
       p("The above interactive visual allows the user to select a national 
               team to receive data on the visual outline of the country and the exact number 
               of goals that team has scored in its history. This visual can be used with the global 
         density map visual (below) if you are unsure of the location of the national team of interest."),
       tags$h2(),
       tags$h2("Global Density Map"),
       plotlyOutput(outputId = "worldMap", height = 700),
       p("The above visual depicts the density of goals scored by National Football Teams relative to eachother,
               where the darker the color, the more goals that country's national team has scored. By hovering over a country
               you will also receive feedback on the exact number of goals scored.")
       )
      )
     )
   

summary_page <- tabPanel(
  "Summary",
  titlePanel("Summary Takeaways"), 
  p("The research questions posed based on our dataset led to a variety of 
  conclusions through our visual analysis. By examining and visualizing multiple 
  aspects of the dataset, we were better able to understand the significance and
  value of our findings. Our Takeaways:"),
  tags$div(
    tags$ul(
      tags$li("The phrase “home team advantage” is proven true based on the 
      obvious differences in goals scored when teams were at their home location 
      compared to their away location. This trend was apparent for every year in 
      our dataset.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("The visualization of goals scored per country allows us to compare 
      the success of different national teams based on goal performance. Not only 
      does the visualization compare the density of goals in a worldwide perspective, 
      but the interactive features allows the user to handpick countries to receive 
      feedback on the exact number of goals that the National team has scored in
      their history.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("The analysis that we provided based on the line graph that 
      depicted the performances of the England and Scotland national teams can 
      be extremely useful in examining the improvement of the teams which is 
      critical information for coaches, investors, and fans.")
    )
  )
)


shiras_page <- tabPanel(
  "Home Goals vs. Away Goals",
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

#Nathan's Code 
inputs <- sidebarPanel(
  sliderInput(
    inputId = "year_range",
    label = "Choose date range",
    min = min(as.Date(results_df$date)), 
    max = max(as.Date(results_df$date)),
    value = range(as.Date(results_df$date)),
    timeFormat = "%Y-%m-%d"
  ),
  selectInput(
    inputId = "team_one",
    label = "Choose 1st team",
    choices = unique(results_df$home_team),
    selected = "England"
  ),
  selectInput(
    inputId = "team_two",
    label = "Choose 2nd team",
    choices = unique(results_df$home_team),
    selected = "Scotland"
  ),
  checkboxInput(
    inputId = "smooth_line",
    label = "Show smooth line?",
    value = T
  )
)

nathans_page <- tabPanel(
  "Comparing Team Performance",
  titlePanel("Comparing Team Performance"),
  sidebarLayout(inputs, 
                mainPanel(plotlyOutput("comparison_plot"),
                          p("This plot allows users to compare the performance for two teams. The user can select the teams they want to
    compare, adjust the timeframe of comparison, and show a smooth line to spot general trends. Insights gained
    from this chart include, which teams have performed better historically, which teams are growing more competitive
    in recent years, and the likelihood of a team winning against the other."))),
)


report_page <- tabPanel(
  "Report Page",
  titlePanel("Report Page"),
  p("From looking at the", em("International Football Results from 1872 to 2022"), "results, we have made a lot of interesting discoveries. Firstly, we created a map visualization that revealed the number of goals scored per country. This goal density visualization allowed us to see a big picture overview of national teams’ performance. We figure that this type of analysis can help the national teams themselves, but also the players and supporters as they can be informed on the status of their team’s success. Secondly, we created a home goal vs. away goal bar chart over time. The bar chart helped prove the", em("home game advantage theory"), "-- a theory that states that teams that play a match in their home city are more likely to win than teams that play a match away, at a city they are not from. We figure that this type of analysis can help team managers and coaches that are worried that the home game advantage may no longer serve them; they can refer to this analysis and see that when they play home, they will be much more likely to win, and therefore need to prepare their teams when they play away. Lastly, we created a line graph analysis of two user selected teams to show how two teams can be compared and to inspire similar comparison analysis in the future. We figure this type of information can help coaches, fans, and investors make decisions about which team to support financially. Overall, our project reveals the various and interesting ways that soccer data can be observed and analyzed.")
)

ui <- navbarPage("AC-2 Project", introduction_page, shiras_page, nathans_page, deeanas_page, report_page, summary_page)