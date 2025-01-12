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

# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------


#--------------------------------- UG data analysis -------------------------------------------- 
ug_qualification_status <- sort(table(required_details$UG.QUALIFICATION.STATUS),decreasing = TRUE)
ug_passing_year <- sort(table(required_details$UG.PASSING.YEAR),decreasing = TRUE)
#ug_course_name <- sort(table(required_details$UG.COURSE.NAME), decreasing = TRUE) ## decreasing order 

# ug_subject_com <- sort(table(required_details$UG.SUBJECT.COMBINATION), decreasing = TRUE)
# remove(ug_subject_com)

# removing ug subject combination
required_details$UG.SUBJECT.COMBINATION <- NULL
required_details$PG.SUBJECT.COMBINATION <- NULL




#view(ug_course_name[1:10])
view(ug_subject_com)

#barplot(ug[1:5])

barplot(ug_passing_year)
barplot(ug_qualification_status , legend.text = ug_qualification_status)




view(ug_passing_year[1:10])

view(ug_qualification_status)

status <- data.frame(ug_qualification_status)

status$Var1




# bar for quick analysis
barplot(ug_qualification_status, legend.text = status$Var1)

# converting into the data frame to change dimensions and change colnames 
ug_qualification_status <- as.data.frame(ug_qualification_status)


# chanigng the colunames to easily identify
colnames(ug_qualification_status) <- c('status','count')

view(ug_qualification_status)










# ---------------------------------------- PG data analysis --------------------------

pg_qualification_status <- table(required_details$PG.QUALIFICATION.STATUS)
view(pg_qualification_status)













