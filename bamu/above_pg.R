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
#****************************** who applied for PHD *****************************



# data separation ( took only PHD )
phd <- required_details %>%
  filter(startsWith(PROGRAMME.NAME ,'DOCTOR OF PHILOSOPHY'))



view(phd)

count_of_above_pg <- nrow(phd)

count_of_above_pg

nrow(phd)



#*********************************************************************************
# total are @@@@ 18736
print(nrow(below_ug_stud) + nrow(pg_stud) + count_of_above_pg)

# sum of these belowPG  + PG  + above PG ( PHD ) = 18736 

# UG or below pg studends are @@@@@@@@@@@@@ 536
nrow(below_ug_stud)

# PG studes are  @@@@@@ 4075
nrow(pg_stud)

# PHD studes are @@@@@@@  14125
nrow(phd)
#*********************************************************************************



# ****************************** NOW WE HAVE SEPARATED DATA AS QUALIFICATION LEVELS ************


any(is.na(phd$PG.PERCENTAGE))


sum(is.na(phd$PG.PERCENTAGE))

# there is no NA values available in the PHD DATAset 



































