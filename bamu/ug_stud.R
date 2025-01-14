#========================== UG or BELOW PG(DIPLOMA, VOCATIONAL COURSE ETC) ===================


#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)



## --------------- Extracting main details (required) from the dataset using pipe operator ---------
## >> TOOK ONLY THOSE DETIALS WHICH WOULD BE REQUIRED FOR THE ANALYSIS ---------------
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
# data separation

##********************* who applied for PG OR other ***************************** ***************
# ********************** TAKING OUT THE BELOW PG STUDENTS ******************
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ( baCHLORS , DIPLOMA , VOCATIONAL TRANING  )


below_ug_stud <- required_details %>%
  filter(!startsWith(PROGRAMME.NAME, 'MASTER OF') ) %>%
  filter(!startsWith(PROGRAMME.NAME,'DOCTOR OF PHILOSOPHY')) %>%
  filter(!startsWith(PROGRAMME.NAME,'POST GRADUATE')) %>%
  filter(!startsWith(PROGRAMME.NAME,'M. VOC.'))


#!!!!!!!!!!!!!!!!!!!!!!   NOTE 🗒!!!!! PG CERTIFICATE's are included in the UG 
# !!!!!!************ B'cause there is not UG details available that may produce FALSE results 


# filter(!startsWith(PROGRAMME.NAME,'PG CERTIFICATE')) %>%


any(!is.na(below_ug_stud$UG.PERCENTAGE))

sum(!is.na(below_ug_stud$UG.PERCENTAGE))


having_ug_details <- below_ug_stud %>%
  filter(!is.na(below_ug_stud$UG.PERCENTAGE))


view(having_ug_details)

nrow(below_ug_stud)

view(below_ug_stud)


barplot(sort(table(below_ug_stud$PROGRAMME.NAME), decreasing = TRUE)[1:10] )





#========================== UG APPEARING STUDENTS ============================


any(!is.na(below_ug_stud$UG.PERCENTAGE))
any(is.na(below_ug_stud$UG.PERCENTAGE))
sum(is.na(below_ug_stud$UG.PERCENTAGE)) # 2 

view(below_ug_stud)


sum(!is.na(below_ug_stud$UG.PERCENTAGE)) # 2 

# there are two ✌  who are appearing

done_ug <- below_ug_stud %>%
  filter(!is.na(below_ug_stud$UG.PERCENTAGE))


# these two ✌ studes are below  
view(done_ug)  # ## KOMAL NAMDEO ADHANE , TANGDE SAURABH RAJU



#================================================================================







































