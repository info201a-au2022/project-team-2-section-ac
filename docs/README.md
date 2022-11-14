
# The `/docs` Directory

All of our project reports can be found in this directory. Our key reports are 
as follows: 


|Report | Brief Description|
|---------------| -----------------|
|[Project Proposal] (https://github.com/info201a-au2022/project-team-2-section-ac/blob/main/docs/p01-proposal.md) |In this project, we pull data from the “International Football Results from 1872 to 2022” dataset, which provides information about different football teams’ performance over time, including which tournaments they played at, whether the game played was a home or away game, and the city / country the team is from. From this dataset, we hope to provide statistics to potential stakeholders like sports fans and team management about which teams are historically competitive, which teams perform better at home / away games, performance by tournament, and how two teams compare to each other 
|[Exploratory Data Analysis](./xxx) | A brief description of your exploratory data analyis report
|[Interactive Vizualizaiton](./xxx) | A brief description of your final report. 


## DEVELOPER Note 0
* If the `/docs` directory or the notes below are confusing, please don't worry - We will cover all of the things below in lecture and/or lab.
* As always, ask your TA or TEAMS if you have questions. 

## DEVELOPER Note 1
`/docs`

* Use the `/docs` directory to organize all for your R Markdown files, which have the extension `.Rmd`.
* Your R Markdown files are used to create reports that can be published on the web as HTML files.  That is, R Markdown (.Rmd) --> web page (.html) --> Published on GitHub in your `/docs` directory.
* This is the basic workflow:
  - Go to RStudio
  - File > New file > R Markdown
  - Edit the file 
  - Save the file in `/docs`
  - From RStudio, Knit the file (this creates an HTML file for publishing)
  - Push your `/docs` directory to your GitHub repository
* Once you push your `/docs` directory, you can view your reports in a web browser by using an URL like this: `https://info-201a-wi22.github.io/final-project/xxx/index.html`

Where: 
1. `info-201a-wi22`    is the organization 
1. `github.io`         is a webserver that GitHub makes available to us
1. `final-project`     is the repository name 
1. `xxx`               is your GitHub username 
1. `index.htlm`        is the document you would like to view

## DEVELOPER Note 2: IMPORTANT: Setting up your webserver 
1. You must make your repository *public*. To make it public: Go to your GitHub repository > Settings (top-right) > Change visibility (Danger Zone) > Make Public
1. You must set the pages source to /docs. To do so: Got your GitHub repository > Pages (bottom-left) > Select "/docs" from the pulldown menu
1. If you run into trouble, pleaes ask your TA or post on Teams - as usual, it is straigthforward once you know how but can be tricky to figure out the first time.

## DEVELOPER Note 3:  Clear and Concise Documentation
* Please remember your audience (prospective employers, open source colleagues, TAs, Instructors). Therefore, 
aim for clarity and conciseness.
* When done, be sure to delete these NOTE sections and the example CSV file (which are intended for you, of course, not your audience!)
