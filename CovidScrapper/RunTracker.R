
#webpage <- read_html("https://www.moneycontrol.com/news/india/coronavirus-cases-death-count-state-wise-tally-july-5-latest-news-today-maharashtra-most-affected-2-5510421.html")
source("MinistryIndia.R")
updatetime="July 07, 2020 08:00 hrs"
updateIndiafromMinistry(updatetime)



source("ProIndiaTracker.R")
scrapUpdatedIndiaData()
