# **Analyzing International Soccer Games from 1872-2022** :soccer:
### Autumn 2022
### Code Name: Soccer Data

## **Authors:**
Shira Zur (szur@uw.edu), Deeana Nasrulai (deeanan@uw.edu), Nathan Beh (nbeh5@uw.edu)

## **Affilitation:**
 INFO-201: Technical Foundations of Informatics - The Information School -
 University of Washington

## **Abstract**
Our main question asks what insights we can gather from extracting data from a record of International Soccer Games (1872-2022). This question is important because it allows us to make predictions about the performance of different teams and whether factors like home vs away games influence the outcome of a game. To address this question, we will use data extraction and visualization techniques to organize, manipulate, and sort data.

## **Keywords**
_sports, soccer, game analytics, game prediction, team performance_

## **Introduction**
In this project, we pull data from the “International Football Results from 1872 to 2022” dataset, which provides information about different football teams’ performance over time, including which tournaments they played at, whether the game played was a home or away game, and the city / country the team is from. From this dataset, we hope to provide statistics to potential stakeholders like sports fans and team management about which teams are historically competitive, which teams perform better at home / away games, performance by tournament, and how two teams compare to each other (for more detail, see the Research Questions below). To answer our questions, we will use data manipulation techniques like DPLYR to filter, sort, and summarize data, as well as our domain knowledge in sports to aid our understanding of the data. We will also use different data visualizations (bars, charts, and graphs) to display information in a clear and visually engaging way.

## **Problem Domain**

- *Sociotechnical Setting:*
Our topic’s setting is the result of all the first official matches beginning from 1872 and ending in 2019. Looking at the sociotechnical part of this setting, it’s evident that the technical aspect of gathering this data was impacted by our society’s culture and traditions around sports. The data only includes matches from men’s soccer games, excluding women’s soccer games; this is an important sociotechnical aspect that we need to keep in mind when using this data in our project.

- *Project Framing:*
When working on this project, we will work together as a team to get our individual parts of the project completed. As a team, we value communication, and have multiple communication channels to achieve success.

- *Human Values:*
A strong human value that we will be coming back to when completing this project is empathy. We will employ this human value when working with one another, making sure that if one of us is experiencing difficulties completing their part of the project, we will listen to them and help them out.

- *Direct stakeholder:*
According to the FIFA Journal, the professional soccer industry has several direct stakeholders, including “soccer associations, confederations, clubs, league and players” (FIFA Journal). Soccer clubs, for instance, can use this data to see which teams have been the most successful in the past several years and therefore use this information when scouting for new players.

- *Indirect stakeholder:*
According to a recent study about ethical leadership in sports [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7747760], indirect stakeholders in the professional soccer industry include soccer coaches. While soccer coaches may not directly seek this data, the board of soccer clubs may use this information to impact their relationship with individual coaches, making coaches indirect stakeholders.

- *Benefits:*
One benefit of this data is that in general, according to an article by The Guardian, soccer data is hard to analyze. There are many factors that go into determining whether a team will be successful or not; therefore, getting this large collection of data that goes back to 1872 will help in the long run of making soccer data better and easier to understand.

- *Harms:*
A clear harm of this data is that it excluded women’s soccer. This data is even further harder to analyze due to a lack of collection, and this data set is continuing this pattern by excluding a whole gender of soccer games and teams.

<<<<<<< HEAD
## **Abstract**
Our main question asks what insights we can gather from extracting data from a record of International Soccer Games (1872-2022). This question is important because it allows us to make predictions about the performance of different teams and whether factors like home vs away games influence the outcome of a game. To address this question, we will use data extraction and visualization techniques to organize, manipulate, and sort data.

## **Keywords**
_sports, soccer, game analytics, game prediction, team performance_

## **Introduction**
In this project, we pull data from the “International Football Results from 1872 to 2022” dataset, which provides information about different football teams’ performance over time, including which tournaments they played at, whether the game played was a home or away game, and the city / country the team is from. From this dataset, we hope to provide statistics to potential stakeholders like sports fans and team management about which teams are historically competitive, which teams perform better at home / away games, performance by tournament, and how two teams compare to each other (for more detail, see the Research Questions below). To answer our questions, we will use data manipulation techniques like DPLYR to filter, sort, and summarize data, as well as our domain knowledge in sports to aid our understanding of the data. We will also use different data visualizations (bars, charts, and graphs) to display information in a clear and visually engaging way.

=======


>>>>>>> 848a0f0503cc4d3ef607bc55952633720ab12fbc

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

We found this data set through Kaggle. The data was collected from several sources including Wikipedia, individual football associations’ websites, and rsssf.com (Rec Sport Soccer Statistics). The data was collected and published by Mart Jurisoo (a data scientist) and posted on Kaggle. His purpose for creating this data set was to make an easy to read list of international football matches so he could analyze team performances easily. The data set does not seem to have any monetary connection to it as most of the information collected is accessible by the public. We have no way to validate the results- unless we individually fact check each match in the data set- as it was a private citizen who collected this data as a hobby but the data is updated regularly to give us accurate information.

## **Expected Implications**
By answering our research question, our analysis could provide sponsors with information about teams they potentially want to sponsor- as they typically want to be represented by a team that performs well. Additionally, this information could provide information for team management, such as how much money they should commit into their program based on the results they see, as well as determine if there needs to be a change to team management structure if they do not see the results they want in our data. Overall the answers provided by our research question can lead to very important monetary decisions when it comes to these national teams. A more laid back implication would be that the answer to our research question could provide everyday fans with context and stats for their favorite teams, especially if they want to put money down on a game.

## **Limitations**
There are a couple of limitations that come up when looking at this data. For one, many countries’ territorial lines and, consequently, their names and demographics, have changed since 1872; however, in the data set, the most current country names are being used. This is erasing the previous history of that country’s soccer teams, resulting in a weaker and less accurate dataset. Another limitation of this dataset is that the majority of its data comes from Wikipedia; since Wikipedia is an open platform where any person can edit any Wikipedia article, the data being used in this dataset might not be the most accurate and could also result in weaker data. Finally, the greatest limitation of this dataset is that it excludes women’s soccer data; women’s soccer data continues to be harder to find and analyze, and our dataset perpetuates this inequality through its collection of only male teams.

## **Acknowledgement**
N/A

## **References**
- Jürisoo, Mart. International Football Results from 1872 to 2022. Kaggle. Web. https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017/discussion?resource=download
- [https://www.professionalfootballjournal.fifa.com/pfj2-7-football-stakeholders#:~:text=The%20professional%20football%20industry%20is,%2C%20clubs%2C%20leagues%20and%20players]
- [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7747760/]
- [https://www.theguardian.com/football/blog/2022/oct/31/data-has-improved-our-understanding-of-football-but-it-remains-a-sport-of-luck]

## **Appendix A: Questions**
