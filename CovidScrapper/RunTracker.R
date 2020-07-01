
#webpage <- read_html("https://www.moneycontrol.com/news/india/coronavirus-cases-death-count-state-wise-tally-june-30-latest-news-today-maharashtra-most-affected-5478261.html")

source("MinistryIndia.R")
updatetime="July 01, 2020 08:00 hrs"
updateIndiafromMinistry(updatetime)



source("ProIndiaTracker.R")
scrapUpdatedIndiaData()
