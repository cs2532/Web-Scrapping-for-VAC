library(robotstxt)
library(rvest)
library(dplyr)
path =paths_allowed('https://www.icc-cricket.com/rankings/womens/team-rankings/odi')

link <-"https://www.icc-cricket.com/rankings/womens/team-rankings/odi"
web<- read_html(link)
team <- web%>%html_nodes(".u-hide-phablet")%>% html_text()
View(team)

points <-web%>%html_nodes("td:nth-child(4)")%>% html_text()
View(points)

team_ranking <-data.frame(team, points)
View(team_ranking)
write.csv(team_ranking,"team_ranking.csv")
