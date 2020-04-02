library(rvest)
library(dplyr)

scrapUpdatedIndiaData = function(){
webpage <- read_html("https://docs.google.com/spreadsheets/d/e/2PACX-1vSc_2y5N0I67wDU38DjDh35IZSIS30rQf7_NYZhtYYGU1jJYT6_kDx4YpF-qw0LSlGsBYP8pqM_a1Pd/pubhtml#")

dateinfo=html_nodes(webpage, xpath = "//table[@class='waffle']")

tbls <- html_nodes(webpage, "table")
tbls_ls <- webpage %>%
  html_nodes("table") 

tbls_ls=tbls_ls[[3]]%>%
  html_table(fill = TRUE)
tbls_ls
df=tbls_ls
names(df) <- as.character(unlist(df[1,]))
df=df[-c(1,3),-c(1,3)]
df
rownames(df) <- NULL
write.csv(df,file = "india_updated_covid.csv", row.names=FALSE)
}

# library("rjson")
# 
# # Give the input file name to the function.
# result <- fromJSON(file = "https://api.covid19india.org/raw_data.json")
# r=result$raw_data
# json_data_frame <- as.data.frame(result)
# length(r)
# i=1
# districData=data.frame("age":NULL,"district":NULL)
# 
# districData <- data.frame(Date=as.Date(character()),
#                  Age=character(), 
#                  District=character(), 
#                  stringsAsFactors=FALSE) 
# 
# for ( i in c(1:1599)){
#   age=r[[i]]$agebracket
#   r[[i]]$
#   
# }
# 
# # Print the result.
# print(result)
# 
# #newdata <- df[order(State),]
# 

# 
# 
# library(rvest)
# library(dplyr)
# library(data.table)
# webpage <- read_html("https://docs.google.com/spreadsheets/d/1029UyWUbxG7eQk4BrCdq6frKgFRPoPfePrYGBcpXKKA/edit?usp=sharing"
#                      )
# 
# 
# tbls <- html_nodes(webpage, "table")
# tbls_ls <- webpage %>%
#   html_nodes("table") 
# 
# tbls_ls=tbls_ls[[1]]%>%
#   html_table(fill = TRUE)
# df=tbls_ls
# names(df) <- as.character(unlist(df[1,]))
# df=df[-c(1),]
# write.csv(df,"test.csv",row.names = FALSE)
# df=read_csv("test.csv")
# 
# 
# fullrecords <-  df[!complete.cases(df)] 
# droprecords <-  df[complete.cases(df)] 
# 
