#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)








## --------------- Extracting main details (required) from the dataset using pipe operator ---------
## >> TAKING ONLY THOSE DETIALS WHICH WOULD BE REQUIRED FOR THE ANALYSIS ---------------
## programme, applicant name, category , ug and pg detials are taken from the dataset


required_details <- data %>% 
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY, UG.COURSE.NAME, UG.PASSING.YEAR
         , UG.QUALIFICATION.STATUS,
         UG.PERCENTAGE, UG.total.attempt, UG.SUBJECT.COMBINATION,
         PG.COURSE.NAME,PG.Year.of.Passing.Appeared.Appearing.final.exam,
         , PG.QUALIFICATION.STATUS, PG.PERCENTAGE,
         PG.total.attempt, PG.SUBJECT.COMBINATION)


# view in the table format

view(required_details)


# ug qalification status 
ug_qualification_status <- table(required_details$UG.QUALIFICATION.STATUS)

# converting into the data frame to change dimensions and change colnames 
ug_qualification_status <- as.data.frame(ug_qualification_status)


# chanigng the colunames to easily identify
colnames(ug_qualification_status) <- c('status','count')

view(ug_qualification_status)














