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
#******************************** PROGRAM DISTRIBUTION *******************************


ug_programmes <- sort(table(below_ug_stud$PROGRAMME.NAME), decreasing = TRUE)

view(ug_programmes)



# ** top 5 Programmes of below PG Level 

view(ug_programmes[1:5])

# CERTIFICATE OF PROFICIENCY (COP) (GERMAN)     69
# BACHELOR OF VOCATION (INDUSTRIAL AUTOMATION)  46
# BACHELOR OF VOCATION(AUTOMOBILE)              39
# PG CERTIFICATE COURSE IN WOMAN STUDIES        39
# DIPLOMA IN TAXATION LAW                       37


barplot(ug_programmes[1:5])



# ** Bottom 5 programmes 

view(ug_programmes[(nrow(ug_programmes)-5): (nrow(ug_programmes))]) 

# ADVANCE DIPLOMA (CHINESE)                 1
# CERTIFICATE IN AMBEDKAR TOURISM           1
# CERTIFICATE(PALI AND BUDDHISM)            1 
# DIPLOMA (CHINESE)                         1
# DIPLOMA (GERMAN)                          1
# DIPLOMA(FRUIT AND VEGETABLE PROCESSING)   1



# top 10 
ug_programmes <- as.data.frame(ug_programmes[1:10])

# bottom 10 
#ug_programmes <- as.data.frame(ug_programmes[(nrow(ug_programmes)-10): (nrow(ug_programmes))])


colnames(ug_programmes) <- c('programmes' , 'enrolled students ')


ggplot(ug_programmes, aes(x = `programmes` , y = `enrolled students `, 
  fill = as.factor(`enrolled students `))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Count of Students Across Programs (Horizontal Bar Plot)",
       x = "Program Name", y = "Number of Students", fill = "Students Count")


#*************************************** GENDEr distribution ************************

ug_gender <- sort(table(below_ug_stud$GENDER), decreasing = TRUE)

view(ug_gender)

# MALE    356
# FEMALE  180

ug_gender <- as.data.frame(ug_gender)

colnames(ug_gender) <- c('gender' , 'enrolled students')


ggplot(ug_gender, aes(x = `gender` , y = `enrolled students`, 
                          fill = as.factor(`enrolled students`))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Count of Students Genderwise (Horizontal Bar Plot)",
       x = "Gener", y = "Number of Students", fill = "Students Count")


























































