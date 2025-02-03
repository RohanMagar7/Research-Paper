# gives the information ( documentation of the function)
?str


getwd()

setwd('F:/R programming')

getwd()



stateInfo <- read.csv('F:/R programming/learning/data_analysis/material/stateData.csv')



# getting data where regino value is 1
View(stateInfo[stateInfo$state.region == 1, ])

