#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)








## --------------- Extracting main details (required) from the dataset using pipe operator ---------
required_details <- data %>% 
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY, UG.COURSE.NAME, UG.PASSING.YEAR
         , UG.QUALIFICATION.STATUS,
         UG.PERCENTAGE, UG.total.attempt, UG.SUBJECT.COMBINATION,
         PG.COURSE.NAME,PG.Year.of.Passing.Appeared.Appearing.final.exam,
         , PG.QUALIFICATION.STATUS, PG.PERCENTAGE,
         PG.total.attempt, PG.SUBJECT.COMBINATION)


# view in the table format

view(required_details)








