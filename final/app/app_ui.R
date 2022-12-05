library(dplyr)
library(shiny)
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

# source('app_server.R')
# deeanas_page <- tabPanel(
#   "National Team's Goal Density",
#     
#    titlePanel("National Team's Goal Density"),
#    sidebarLayout(      
#      sidebarPanel(
#        uiOutput("selectTeam")
#        ),
#      mainPanel(
#        plotOutput(outputId = "worldMap1"),
#        plotOutput(outputId = "worldMap"))
#        
#      )
#    )

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
      uiOutput("selectRange")
    ),
    
    mainPanel(
      plotOutput("ratioPlot"),
      p("The bar graph above represents the home goal ratio vs. the away goal ratio over time.
      The user can use the slider input to change the year range of the bar graph to see how the ratio
      has changed over time."),
      
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

  tags$div(
    tags$ul(
      tags$li("Code name: Soccer Data")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Project title: Analyzing International Soccer Games from 1872
              - 2022")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Authors: Shira Zur, Deeana Nasrulai, Nathan Beh")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Affiliation: INFO-201: Technical Foundations of Informatics -
              The Information School - University of Washington")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Date: Autumn 2022")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Abstract: Our main question asks what insights we can gather
              from extracting data from a record of International Soccer Games
              (1872-2022). This question is important because it allows us to
              make predictions about the performance of different teams and
              whether factors like home vs away games influence the outcome of
              a game. To address this question, we will use data extraction
              and visualization techniques to organize, manipulate, and sort
              data.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Abstract: Our main question asks what insights we can gather
              from extracting data from a record of International Soccer
              Games (1872-2022). This question is important because it allows
              us to make predictions about the performance of different
              teams and whether factors like home vs away games influence
              the outcome of a game. To address this question, we will use
              data extraction and visualization techniques to organize,
              manipulate, and sort data.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Keywords: sports, soccer, game analytics, game
                               prediction, team performance.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Introduction: In this project, we pull data from the
              “International Football Results from 1872 to 2022” dataset,
              which provides information about different football teams’
              performance over time, including which tournaments they
              played at, whether the game played was a home or away game,
              and the city / country the team is from. From this dataset,
              we hope to provide statistics to potential stakeholders like
              sports fans and team management about which teams are
              historically competitive, which teams perform better at home
              / away games, performance by tournament, and how two teams
              compare to each other (for more detail, see the Research
              Questions below). To answer our questions, we will use data
              manipulation techniques like DPLYR to filter, sort, and
              summarize data, as well as our domain knowledge in sports to
              aid our understanding of the data. We will also use different
              data visualizations (bars, charts, and graphs) to display
              information in a clear and visually engaging way.")
      )
    ),
  tags$div(
    tags$ul(
      tags$li("Problem Domain: Sociotechnical Setting: Our topic’s setting
      is the result of all the first official matches beginning from 1872
      and ending in 2019. Looking at the sociotechnical part of this setting,
      it’s evident that the technical aspect of gathering this data was
      impacted by our society’s culture and traditions around sports.
      The data only includes matches from men’s soccer games, excluding
      women’s soccer games; this is an important sociotechnical aspect
      that we need to keep in mind when using this data in our project.
      Project Framing: When working on this project, we will work together
      as a team to get our individual parts of the project completed. As a
      team, we value communication, and have multiple communication channels
      to achieve success. Human Values: A strong human value that we will
      be coming back to when completing this project is empathy. We will
      employ this human value when working with one another, making sure
      that if one of us is experiencing difficulties completing their part
      of the project, we will listen to them and help them out. Direct
      stakeholder: According to the FIFA Journal, the professional soccer
      industry has several direct stakeholders, including “soccer
      associations, confederations, clubs, league and players”
      (FIFA Journal). Soccer clubs, for instance, can use this data to
      see which teams have been the most successful in the past several
      years and therefore use this information when scouting for new players.
      Indirect stakeholder: According to a recent study about ethical
      leadership in sports [https://www.ncbi.nlm.nih.gov/pmc/articles/
      PMC7747760], indirect stakeholders in the professional soccer industry
      include soccer coaches. While soccer coaches may not directly seek
      this data, the board of soccer clubs may use this information to
      impact their relationship with individual coaches, making coaches
      indirect stakeholders. Benefits: One benefit of this data is that
      in general, according to an article by The Guardian, soccer data is
      hard to analyze. There are many factors that go into determining
      whether a team will be successful or not; therefore, getting this
      large collection of data that goes back to 1872 will help in the
      long run of making soccer data better and easier to understand.
      Harms: A clear harm of this data is that it excluded women’s soccer.
      This data is even further harder to analyze due to a lack of
      collection, and this data set is continuing this pattern by excluding
      a whole gender of soccer games and teams.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Research Questions: Which national teams are more likely to
      win at home or away games? This question enables us to dive into the
      performance statistics of the temas to conduct analysis to conclude
      whether the term “home team advantage” is true. Which National Teams
      has the most total wins from 1872-2022? This question allows us to see
      a big picture overview of National team performances from the start of
      data collection. This could provide analysis that could help national
      teams/players/supporters be informed on the status of their team’s
      success. This also informs us which team has been the most dominant
      in the history of soccer. Which country/national team has the most
      wins at X tournament? This question is important because it allows us
      not only to compare countries' overall performances, but narrows the
      scope to certain tournaments so analysis can be available to form
      conclusions on which tournaments certain teams excel or underperform
      at. Which national team was more likely to win in a penalty shootout?
      This question enables us to perform analysis on teams that are more
      likely to win a penalty shootout. This is a useful question for teams
      because it provides them information on their typical penalty shooters
      and whether or not they compare well to other teams. What is the goal
      performance of X team compared to Y team? This question allows us to
      compare only the performances of two teams. This is an important
      question for those who want to know the chances of one team winning
      over another or which team outperforms the other in goals.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("The Dataset: The data set we are using is called
              “International Football Results from 1872 to 2022”.
              This data set relates to our problem domain/research
              question as were our analyzing the performance of different
              football (soccer) national teams. The data set provides us
              information that can answer a multitude of questions but the
              research questions we chose were to specifically give us
              information on overall team performances as well as providing
              comparisons of teams to each other. The data set contains 2
              files, one of match results, and another of penalty shootout
              results is any of the tournament matches ended in a tie.
              Number of rows: 44,061, 506. Number of Columns: 9, 4. Link
              to Dataset: [International Football Results from 1872 to 2022]:
              https://www.kaggle.com/datasets/martj42/international-football-
              results-from-1872-to-2017. We found this data set through
              Kaggle. The data was collected from several sources including
              Wikipedia, individual football associations’ websites, and
              rsssf.com (Rec Sport Soccer Statistics). The data was
              collected and published by Mart Jurisoo (a data scientist)
              and posted on Kaggle. His purpose for creating this data set
              was to make an easy to read list of international football
              matches so he could analyze team performances easily. The
              data set does not seem to have any monetary connection to
              it as most of the information collected is accessible by
              the public. We have no way to validate the results- unless
              we individually fact check each match in the data set- as
              it was a private citizen who collected this data as a hobby
              but the data is updated regularly to give us accurate
              information.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Findings: Through our 3 visualizations we have made 3
              findings from our analyzations. Through our interactive
              world map, we have found which teams have scored the most
              goals and which teams have scored the least over time.
              Through our home ratio vs. away ratio bar graph, we have
              found that the home advantage theory stands, and that teams
              are more likely to win at home than away. Lastly, through
              our interactive comparison line graph, we have found that
              it is very useful to compare different teams statistically
              to see which ones are stronger and have remained more
              successful over time than others.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Discussion: It seems that there is still a lot more to
              discuss when it comes to the soccer data, and we hope our
              analysis has sparked more thoughts about how soccer data
              can be analyzed. We wonder how the home ratio vs. away
              ratio pattern, for instance, will change as more soccer
              players are becoming used to playing away and clubs
              continue to travel. We also wonder about the comparison
              of 2 different teams, especially now that the World Cup
              is under way. Will putting two teams against each other
              using our interactive line graph help predict World Cup
              matches, for instance? Overall, we hope our analysis will
              continue to spark more ideas on how soccer data can be
              analyzed in the future.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("Conclusion: In conclusion, it seems we have more to learn
              about analyzing soccer data, but we feel that we have provided
              some insightful conversations on how one can start breaking
              down such a large data set and find patterns within it. Our
              project has showcased 3 different ways to analyze soccer data
              -- comparing statistics, evaluating theories, and mapping out
              world data. There were other societal issues that impacted our
              results, such as how some teams, especially European teams,
              have more funding and consequently higher statistics than
              poorer teams. Our data also had missing parts to it which
              impacted our results. However, overall, we hope we have
              sparked a strong conversation about soccer data analysis.")
    )
  ),
  tags$div(
    tags$ul(
      tags$li("References: Jürisoo, Mart. International Football Results
              from 1872 to 2022. Kaggle. Web. https://www.kaggle.com/
              datasets/martj42/international-football-results-from-1872-to-
              2017/discussion?resource=download, https://www.professional
              footballjournal.fifa.com/pfj2-7-football-stakeholders#:~:tex
              t=The%20professional%20football%20industry%20is,%2C%20clubs%
              2C%20leagues%20and%20players, https://www.ncbi.nlm.nih.gov/
              pmc/articles/PMC7747760/, https://www.theguardian.com/football
              /blog/2022/oct/31/data-has-improved-our-understanding-of-
              football-but-it-remains-a-sport-of-luck.")
    )
  )
)


ui <- navbarPage("AC-2 Project", introduction_page, shiras_page, nathans_page, deeanas_page, report_page, summary_page)