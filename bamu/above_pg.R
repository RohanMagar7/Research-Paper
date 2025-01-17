#========================== UG or BELOW PG(DIPLOMA, VOCATIONAL COURSE ETC) ===================
#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)


## --------------- Extracting main details (required) from the dataset using pipe operator ---------
## >> TOOK ONLY THOSE DETIALS WHICH WOULD BE REQUIRED FOR THE ANALYSIS ---------------
## programme, applicant name, category , ug and pg detials are taken from the dataset



required_details <- data %>% 
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY,,MARITAL.STATUS,
         GENDER, EMAIL ,FAMILY.INCOME, UG.COURSE.NAME, 
         DOB.YEAR, AGE..AS.REFERENCED.,UG.PASSING.YEAR,
         OU.DISTRICT 
         ,  DISTRICT , PG.DIVISION , PINCODE , PERMANENT.ADDRESS.LINE.2  ,
         AADHAR.CARD , PERMANENT.ADDRESS.LINE.1,
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

#*************************************************************************************


# Extract years, months, and days from the AGE..AS.REFERENCED.
required_details <- required_details %>%
  mutate(
    Years = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= YEARS)")),
    Months = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= MONTHS)")),
    Days = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= DAYS)"))
  )


# Extract years, months, and days from the AGE..AS.REFERENCED. from the PHD ***************
phd <- phd %>%
  mutate(
    Years = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= YEARS)")),
    Months = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= MONTHS)")),
    Days = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= DAYS)"))
  )


# Extract years, months, and days from the AGE..AS.REFERENCED. from the UG ***************
below_ug_stud <- below_ug_stud %>%
  mutate(
    Years = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= YEARS)")),
    Months = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= MONTHS)")),
    Days = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= DAYS)"))
  )


# Extract years, months, and days from the AGE..AS.REFERENCED. from the PG ***************
pg_stud <- pg_stud %>%
  mutate(
    Years = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= YEARS)")),
    Months = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= MONTHS)")),
    Days = as.numeric(str_extract(AGE..AS.REFERENCED., "\\d+(?= DAYS)"))
  )


phd <- phd %>%
  mutate(Age_in_Years = Years + (Months / 12) + (Days / 365.25))


pg_stud <- pg_stud %>%
  mutate(Age_in_Years = Years + (Months / 12) + (Days / 365.25))

below_ug_stud <- below_ug_stud %>%
  mutate(Age_in_Years = Years + (Months / 12) + (Days / 365.25))


required_details <- required_details %>%
  mutate(Age_in_Years = Years + (Months / 12) + (Days / 365.25))


# checking the na values 
sum(is.na(required_details$Age_in_Years))  # Count missing values

#if neccessary 
# required_details$Age_in_Years[is.na(required_details$Age_in_Years)] <- mean(required_details$Age_in_Years, na.rm = TRUE)


# density plot of ages of UG , PG and PHD students 
ggplot() +
  geom_density(data = below_ug_stud, aes(x = Years, fill = "UG"), alpha = 0.5) +
  geom_density(data = pg_stud, aes(x = Years, fill = "PG"), alpha = 0.5) +
  geom_density(data = phd, aes(x = Years, fill = "PhD"), alpha = 0.5) +
  labs(title = "Age Distribution Across Education Levels", x = "Age (Years)", fill = "Education Level")

#****************************************************************************************

# predictive moding 

length(phd$PG.QUALIFICATION.STATUS)

view(table(phd$PG.QUALIFICATION.STATUS))
# it has binary state   PASSED AND APPEARING 

phd$PG.QUALIFICATION.STATUS <- ifelse(phd$PG.QUALIFICATION.STATUS == "PASSED", 1, 0)

model <- glm(PG.QUALIFICATION.STATUS ~ PG.PERCENTAGE + FAMILY.INCOME + AGE..AS.REFERENCED., 
             data = phd, family = "binomial")
summary(model)




#*******************************************************************************************
#*********************************** CHECK DUPLICATES **************************************
#*******************************************************************************************


# TRUe there are a few duplicates by the names
any(duplicated(phd$NAME.OF.THE.APPLICANT))

 
# 240 are duplicates 
sum(duplicated(phd$NAME.OF.THE.APPLICANT))

#*****************************************************************************************
#************************************** GETTING DUPLICATES *******************************
#*****************************************************************************************


#DUPLICATE BY NAME AND EMAIL
duplicate_by_name_and_email <- phd %>%
  filter(duplicated(NAME.OF.THE.APPLICANT) & duplicated(EMAIL))


#DUPLICATE BY NAMES
duplicate_names <- phd %>%
  filter(duplicated(NAME.OF.THE.APPLICANT)  )


# DUPLICATE BY EMAIL 
duplicate_by_email <- phd %>%
  filter(duplicated(EMAIL))

view(duplicate_names)
view(duplicate_by_name_and_email)
View(duplicate_by_email)



# ***** CROSS CHECKING WHETHER DATA IS DUPLICATE OR NOT 

#!!!!!!!!!!!!! NOTE THE SAMPLE NAMES ARE TAKEN FROM THE DUPLICATE DATASET 

# Random sample 1
dup <- phd %>% 
  filter(NAME.OF.THE.APPLICANT == 'KORDE PRAVIN RAMESHWAR' && )


# Random sample 2
dup2 <- phd %>% 
  filter(NAME.OF.THE.APPLICANT == 'MANYAR AYAJAHMED MAHAMADHANIF')

# Random sample 3
dup3 <- phd %>% 
  filter(NAME.OF.THE.APPLICANT == 'ANMOD SHUBHANGI JAIKUMAR')

# Random sample 4
dup4 <- phd %>% 
  filter(NAME.OF.THE.APPLICANT == 'INGLE SANJAY RAMBHAU')

# Random sample 5
dup5 <- phd %>% 
  filter(NAME.OF.THE.APPLICANT == 'AMALE PALLAVI VISHNUPANT')


# confirmed that these data are duplicate 
view(rbind(dup,dup2,dup3, dup4, dup5))


View(sort(table(duplicate_names$NAME.OF.THE.APPLICANT), decreasing = TRUE))


#______________________________________________________________________

# *************************** EXPORTING THE DUPLICATE DATASET ****** 

write.csv(duplicate_names, "C:/Users/HP/Downloads/duplicate_data.csv")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ REMOVING DUPLICATES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
# FIRST WAY TO REMOVE 
distinct_df <- phd %>%
  distinct(NAME.OF.THE.APPLICANT, .keep_all = TRUE)


# ANOTHER WAY TO REMOVE DUPLICATES 
distinct_df2 <- phd[!duplicated(phd$NAME.OF.THE.APPLICANT) , ]

nrow(distinct_df2)
nrow(distinct_df)
any(duplicated(distinct_df$NAME.OF.THE.APPLICANT))



# CHEKCING NOT DUPLICATE

no_duplicate_check1 <- distinct_df %>% 
  filter(NAME.OF.THE.APPLICANT == 'MANYAR AYAJAHMED MAHAMADHANIF')



view(no_duplicate_check1)
#*************************************************************************************
#****************************** NOW DUPLICATES ARE REMOVED ✅   **********************
#*************************************************************************************

view(phd)


view(sort(table(phd$PG.UNIVERISTY.NAME), decreasing = TRUE))


university_type <- sort(table(phd$PG.UNIVERISTY.NAME), decreasing = TRUE)


university_type <- as.data.frame(university_type)

colnames(university_type) <- c('University','Count')


ggplot(university_type, aes(x = `University` , y = `Count`, fill = as.factor(`Count`))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "University Type Home or Other (Horizontal Bar Plot)",
       x = "University", y = "Number of Students", fill = "Count")



#********************************************************************************************
#****************************** ADDRESS WISE CLASSIFICATION **********************************
#********************************************************************************************
#********************************************************************************************





write.csv(distinct_df,'C:/Users/HP/Downloads/filtered_phd_data.csv')

print(nrow(distinct_df) + 240)


nrow(phd)















