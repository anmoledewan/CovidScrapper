
library(rvest)
webpage <- read_html("https://www.mohfw.gov.in/#cases")
tbls <- html_nodes(webpage, "table")
tbls_ls <- webpage %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)
tbls_ls

dateinfo=html_nodes(webpage, xpath = "//div[@class='content newtab']")[[1]]
dateinfo%>%html_nodes("p") %>% html_text()


df=data.frame(tbls_ls[[10]])
indiaData=df

confirmed=indiaData[,c(2,3)]
names(confirmed)[ncol(confirmed)-1]="States"
names(confirmed)[ncol(confirmed)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
confold=read.csv("india_confirmed_covid.csv")
if(mean(confold[,ncol(confold)]==confirmed[,ncol(confirmed)])!=1){
  
  confirmed=cbind(read.csv("india_confirmed_covid.csv"),confirmed[,2])
  write.csv(confirmed,file = "india_confirmed_covid.csv")  
}


deaths=indiaData[,c(2,5)]
names(confirmed)[ncol(confirmed)-1]="States"
names(confirmed)[ncol(confirmed)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
confold=read.csv("india_death_covid.csv")
if(mean(confold[,ncol(confold)]==deaths[,ncol(deaths)])!=1){
deaths=cbind(read.csv("india_death_covid.csv"),deaths[,2])
write.csv(deaths,file = "india_death_covid.csv")
}

recovered=indiaData[,c(2,4)]
names(confirmed)[ncol(confirmed)-1]="States"
names(confirmed)[ncol(confirmed)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
confold=read.csv("india_recovered_covid.csv")
if(mean(confold[,ncol(confold)]==recovered[,ncol(recovered)])!=1){
recovered=cbind(read.csv("india_recovered_covid.csv"),recovered[,2])
write.csv(recovered,file = "india_recovered_covid.csv")
}


