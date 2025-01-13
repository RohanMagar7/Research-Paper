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
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY,,MARITAL.STATUS,
         GENDER, EMAIL ,FAMILY.INCOME, UG.COURSE.NAME, 
         DOB.YEAR, AGE..AS.REFERENCED.,UG.PASSING.YEAR,
         HOSTEL.REQUIRED  ,XII.PERCENTAGE ,XII.PASSING.YEAR
         ,PINCODE ,PERMANENT.ADDRESS.LINE.1 ,PERMANENT.ADDRESS.LINE.2 ,
         COUNTRY,STATE , Are.you.Citizen.of.India. ,MINORITY ,RELIGION,
         ,PLACE.OF.BIRTH..COUNTRY. ,PLACE.OF.BIRTH..STATE., ,MOBILE,
         , UG.QUALIFICATION.STATUS,
         UG.PERCENTAGE, UG.total.attempt, UG.SUBJECT.COMBINATION,
         PG.COURSE.NAME,PG.Year.of.Passing.Appeared.Appearing.final.exam,
         , PG.QUALIFICATION.STATUS, PG.PERCENTAGE,
         PG.total.attempt, PG.SUBJECT.COMBINATION)


# view in the table format

view(required_details)

# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------




#----------------------------------------------------- 12th details 

twelth <- sort(table(required_details$XII.PERCENTAGE), decreasing = TRUE)

barplot(twelth[1:10] )

summary(required_details$XII.PERCENTAGE)

any(is.na(required_details$XII.PASSING.YEAR))

# there is no na vlaues in xii 

programme <- as.data.frame(sort(table(required_details$PROGRAMME.NAME), decreasing = TRUE)[1:10])

colnames(programme) <- c('programme Name','Enrolled Students')



#======================================= VISUALIZATION ==========================

# Correlation Between XII Marks and UG/PG Percentage

cor(dataset$XII.PERCENTAGE, dataset$UG.PERCENTAGE, use = "complete.obs")
cor(dataset$UG.PERCENTAGE, dataset$PG.PERCENTAGE, use = "complete.obs")



ggplot(dataset, aes(x = XII.PERCENTAGE, y = UG.PERCENTAGE)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "XII Marks vs UG Percentage", x = "XII Percentage", y = "UG Percentage")


