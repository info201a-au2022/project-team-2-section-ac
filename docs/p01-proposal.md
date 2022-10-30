# **Analyzing International Soccer Games from 1872-2022**
### Autumn 2022
### Code Name: Soccer Data

## **Authors:**
Shira Zur (szur@uw.edu), Deeana Nasrulai (deeanan@uw.edu), Nathan Beh (nbeh5@uw.edu)

## **Affilitation:**
 INFO-201: Technical Foundations of Informatics - The Information School -
 University of Washington












## **Abstract**
Our main question asks what insights we can gather from extracting data from a record of International Women's Soccer Games (1872-2022). This question is important because it allows us to make predictions about the performance of different teams and whether factors like home vs away games influence the outcome of a game. To address this question, we will use data extraction and visualization techniques to organize, manipulate, and sort data.

## **Keywords**
_sports, women's soccer, game analytics, game prediction, team performance_

## **Introduction**
In this project, we pull data from the “International Football Results from 1872 to 2022” dataset, which provides information about different football teams’ performance over time, including which tournaments they played at, whether the game played was a home or away game, and the city / country the team is from. From this dataset, we hope to provide statistics to potential stakeholders like sports fans and team management about which teams are historically competitive, which teams perform better at home / away games, performance by tournament, and how two teams compare to each other (for more detail, see the Research Questions below). To answer our questions, we will use data manipulation techniques like DPLYR to filter, sort, and summarize data, as well as our domain knowledge in sports to aid our understanding of the data. We will also use different data visualizations (bars, charts, and graphs) to display information in a clear and visually engaging way.


## **Research Questions**

- **_Which national teams are more likely to win at home or away games?_**   
This question enables us to dive into the performance statistics of the temas to conduct analysis to conclude whether the term “home team advantage” is true.
- **_Which National Teams has the most total wins from 1872-2022?_**  
This question allows us to see a big picture overview of National team performances from the start of data collection. This could provide analysis that could help national teams/players/supporters be informed on the status of their team’s success. This also informs us which team has been the most dominant in the history of soccer.
- **_Which country/national team has the most wins at X tournament?_**   
This question is important because it allows us not only to compare countries' overall  performances, but narrows the scope to certain tournaments so analysis can be available to form conclusions on which tournaments certain teams excel or underperform at.
- **_Which national team was more likely to win in a penalty shootout?_**  
This question enables us to perform analysis on teams that are more likely to win a penalty shootout. This is a useful question for teams because it provides them information on their typical penalty shooters and whether or not they compare well to other teams.
- **_What is the goal performance of X team compared to Y team?_**   
This question allows us to compare only the performances of two teams. This is an important question for those who want to know the chances of one team winning over another or which team outperforms the other in goals.

## **The Dataset**
The data set we are using is called “International Football Results from 1872 to 2022”. This data set relates to our problem domain/research question as were our analyzing the performance of different football (soccer) national teams. The data set provides us information that can answer a multitude of questions but the research questions we chose were to specifically give us information on overall team performances as well as providing comparisons of teams to each other.  The data set contains 2 files, one of match results, and another of penalty shootout results is any of the tournament matches ended in a tie.   
| Data File Name  | Results | Shootout|
| :--------------- | :-------: | :-------: |
|Number of rows   | 44,061  | 506     |
|Number of Columns| 9       | 4       |

Link to Dataset: [International Football Results from 1872 to 2022]: https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017

We found this data set through kaggle. The data was collected from several sources including Wikipedia, individual football associations’ websites, and rsssf.com (Rec Sport Soccer Statistics). The data was collected and published by Mart Jurisoo (a data scientist) and posted on Kaggle. His purpose for creating this data set was to make an easy to read list of international football matches so he could analyze team performances easily. The data set does not seem to have any monetary connection to it as most of the information collected is accessible by the public. We have no way to validate the results- unless wse individually fact check each match in the data set- as it was a private citizen who collected this data as a hobby but the data is updated regularly to give us accurate information.

## **Expected Implications**
By answering our research question, our analysis could provide sponsors with information about teams they potentially want to sponsor- as they typically want to be represented by a team that performs well. Additionally, this information could provide information for team management, such as how much money they should commit into their program based on the results they see, as well as determine if there needs to be a change to team management structure if they do not see the results they want in our data. Overall the answers provided by our research question can lead to very important monetary decisions when it comes to these national teams. A more laid back implication would be that the answer to our research question could provide everyday fans with context and stats for their favorite teams, especially if they want to put money down on a game.


















## **Acknowledgement**

## **References**
- Jürisoo, Mart. International Football Results from 1872 to 2022. Kaggle. Web. https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017/discussion?resource=download

## **Appendix A: Questions**
