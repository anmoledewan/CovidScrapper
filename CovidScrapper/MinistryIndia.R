


library(readr)
library(rvest)
library(stringr)
numextract <- function(string){ 
  str_extract(string, "\\-*\\d+\\.*\\d*")
} 

updateIndiafromMinistry = function(string){
  webpage <- read_html("https://www.mohfw.gov.in/#cases")
  tbls <- html_nodes(webpage, "table")
  tbls_ls <- webpage %>%
    html_nodes("table") %>%
    html_table(fill = TRUE)

  
  df=data.frame(tbls_ls[[1]])
  y=  grep("Remaining", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("States wise", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  
  y=  grep("shifted", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("figures", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("reassigned", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("assigned", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("Repeat", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("cases", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  y=  grep("foreign", df[,2])
  str(y)
  if(length(y)!=0){
    df=df[-y,]
  }
  
  
  
  
  indiaData=df
  #indiaData[,2]=as.character(gsub("^[A-z]", "", indiaData[,2]))
  indiaData[,2]= str_replace_all(indiaData[,2], "[[:punct:]]", "")
  indiaData[,3]=as.numeric(gsub("\\D", "", indiaData[,3]))
  indiaData[,4]=numextract(as.numeric(indiaData[,4]))
  indiaData[,5]=numextract(as.numeric(indiaData[,5]))
  
  confirmed=indiaData[,c(2,3)]
  names(confirmed)[ncol(confirmed)-1]="States"
  names(confirmed)[ncol(confirmed)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
  confold=read_csv("india_confirmed_covid.csv")[,-1]
  confold
  
    confirmed=merge(x = confold, y = confirmed, by = "States", all = TRUE)
    confirmed[is.na(confirmed)] <- 0
    names(confirmed)[ncol(confirmed)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
    #confirmed
    write.csv(confirmed,file = "india_confirmed_covid.csv")
    

  
  
  deaths=indiaData[,c(2,5)]
  names(deaths)[ncol(deaths)-1]="States"
  names(deaths)[ncol(deaths)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
  confold=read_csv("india_death_covid.csv")[,-1]
  
    
    deaths=merge(x = confold, y = deaths, by = "States", all = TRUE)
    deaths[is.na(deaths)] <- 0
    names(deaths)[ncol(deaths)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
    write.csv(deaths,file = "india_death_covid.csv")
    
  
  
  recovered=indiaData[,c(2,4)]
  names(recovered)[ncol(recovered)-1]="States"
  names(recovered)[ncol(recovered)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
  confold=read_csv("india_recovered_covid.csv")[,-1]
    
    recovered=merge(x = confold, y = recovered, by = "States", all = TRUE)
    recovered[is.na(recovered)] <- 0
    names(recovered)[ncol(recovered)]=trimws(format(as.POSIXlt(Sys.time()),tz = "Asia/Calcutta"), which = c("both"))
    write.csv(recovered,file = "india_recovered_covid.csv")
  
  
  
  
  df1=read_csv("india_recovered_covid.csv")[,-c(1)]
  
  x <- as.character(df1$States) %in% "Total number of confirmed cases in India"
  
  df1=rbind(df1[!x,], df1[x,])

  names(df1)[ncol(df1)]=updatetime
  write.csv(df1,file = "india_recovered_covid.csv")
  
  df1=read_csv("india_death_covid.csv")[,-c(1)]
  x <- as.character(df1$States) %in% "Total number of confirmed cases in India"
  df1=rbind(df1[!x,], df1[x,])

  names(df1)[ncol(df1)]=updatetime
  write.csv(df1,file = "india_death_covid.csv")
  
  df1=read_csv("india_confirmed_covid.csv")[,-c(1)]
  x <- as.character(df1$States) %in% "Total number of confirmed cases in India"
  df1=rbind(df1[!x,], df1[x,])
  
  names(df1)[ncol(df1)]=updatetime
  write.csv(df1,file = "india_confirmed_covid.csv")
}


