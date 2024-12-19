expanded_path <- path.expand('-')

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)


expanded_path


demo()

demo(graphics)



# getting working directory
wkdir <- getwd()



# setting working directory
#setwd('F:/R programming/data cleaning/ug colleges')


getwd()


dir()

dir(pattern = '.txt')       

dir(pattern = '.R')   

file.exists('bamudb.R')

newdirPath <- 'createdbycode'

if ( file.exists(wkdir)) dir.create(newdirPath)

dir(pattern = 'create')

# creating a file
file.create('learning.R')

library(ggplot2)


ggplot(data=diamonds,aes(x=price))+
  geom_histogram()



ggplot(data=diamonds,aes(x=price))+
  geom_histogram(fill='green',col='orange')


ggplot(diamonds,aes(x=price))+
  geom_bar()


ggplot(data = diamonds,aes(x=cut,fill = cut))+
  geo_bar()



view(diamonds)


ggplot(data = diamonds,aes(x=carat,y=price,col=cut))+
  geom_point()



ggplot(data=diamonds,aes(x=clarity,y=carat)) +
  geom_boxplot()


ggplot(data=diamonds,aes(x=clarity,y=carat,fill=cut))+
  geom_boxplot()




clean$data <- diamonds[!duplicated(data),]

view(clean)

view(clean$data)



# remove duplicates 
duplicate <- bamudb$PROGRAMME.NAME
cleandata <- duplicate[!duplicated(duplicate)]
view(cleandata)



# Explore how duplicated() flags dulicate rows 

# Experiment with growing variables to identify duplicates in specific columns 


# Handle Missing DAta


df <- data.frame(bamudb)

duplicates <- df[duplicated(df$PROGRAMME.NAME),]

duplicates <- bamudb[duplicated(bamudb),]

View(duplicates)



colnum <- [which(bamudb$NAME.OF.THE.APPLICANT),]


# Find the column number for "Age"

column_number <- which(colnames(bamudb) == "NAME.OF.THE.APPLICANT")

column_number


View(head(bamudb))







