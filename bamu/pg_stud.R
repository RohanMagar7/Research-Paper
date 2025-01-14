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


# view in the table format

view(required_details)

# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------

##******************************* who applied for PG  ********************************


# data separation
pg_stud <- required_details %>%
  filter(!startsWith(PROGRAMME.NAME,'DOCTOR OF PHILOSOPHY')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'BACHELOR') ) %>%
  filter(!startsWith(PROGRAMME.NAME,'ADVANCE DIPLOMA ')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'DIPLOMA')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'CERTIFICATE')) %>%
  filter(!startsWith(PROGRAMME.NAME,'PG CERTIFICATE')) %>%
  filter(!startsWith(PROGRAMME.NAME,'PG '))



# filter(startsWith(PROGRAMME.NAME,'M. VOC.'))


  
#!!!!!!!!!!!!!!!!! PG CERTIFICATE courses are not full time PG programme 
# !!!!!!!!!!!!!! there is no UG Details  that's why PG CERTIFICAT'S are excluded from the pg dataset
  
  
pg_not_having_ug <- pg_stud %>%
  filter(is.na(UG.PERCENTAGE))


view(pg_not_having_ug)


any(is.na(pg_stud$UG.PERCENTAGE))

sum(is.na(pg_stud$UG.PERCENTAGE))

## now every PG student having their PG percentages 


view(pg_stud)

view(table(pg_stud$PROGRAMME.NAME))

nrow(pg_stud) #### 4075

count_of_ug_done_students <- nrow(not_pg_done) ### 4075


# ****************************** NOW WE HAVE SEPARATED DATA AS QUALIFICATION LEVELS ************


any(is.na(phd$UG.PERCENTAGE))


sum(is.na(phd$UG.PERCENTAGE))

# there is no NA values available in the PG DATAset 



#*******************************************************************************************
