
#webpage <- read_html("")

source("MinistryIndia.R")
updatetime="July 01, 2020 08:00 hrs"
updateIndiafromMinistry(updatetime)



source("ProIndiaTracker.R")
scrapUpdatedIndiaData()
