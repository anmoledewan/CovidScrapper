
webpage <- read_html("https://www.moneycontrol.com/news/india/coronavirus-cases-death-count-state-wise-tally-july-5-latest-news-today-maharashtra-most-affected-5509161.html")

source("MinistryIndia.R")
updatetime="July 05, 2020 08:00 hrs"
updateIndiafromMinistry(updatetime)



source("ProIndiaTracker.R")
scrapUpdatedIndiaData()
