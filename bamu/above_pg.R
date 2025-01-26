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
         OU.DISTRICT , PG.UNIVERISTY.NAME , PG.UNIVERSITY.NAME..OTHER.
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
#dup <- phd %>% 
#  filter(NAME.OF.THE.APPLICANT == 'KORDE PRAVIN RAMESHWAR' && )


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


write.csv(distinct_df,'C:/Users/HP/Downloads/filtered_phd_data.csv')

print(nrow(distinct_df) + 240)


nrow(phd)

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

# districts 
districts <- sort(table(phd$DISTRICT) , decreasing = TRUE)[1:20]

# states 
states <- sort(table(phd$STATE), decreasing = TRUE)

view(states)
view(districts)

#!!!!!!  students are came from 110 Districts 
nrow(districts)
nrow(states)

barplot(districts)
barplot(states)

districts <- as.data.frame(districts)
colnames(districts) <- c('District','Count')

view(districts)


#!!!!!!!!!!!!!!!!!!!!!  95 STUDENTS HAVE NO DISTRICT NAMES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

ggplot(districts, aes(x = `District` , y = `Count`, fill = as.factor(`Count`))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "DISTRICT WISE STUDENT COUNT ( TOP 20 DISTRICTS )",
       x = "District", y = "Number of Students", fill = "Count")


#**********************************************************************

university_data <- read.csv("C:/Users/HP/Downloads/univer.csv")

view(university_data)


university_names <- university_data$Name.of.the.University


length(university_names)

view(university_names)


### clean names 

preprocess <- function(name) {
  name <- tolower(name)                   # Convert to lowercase
  name <- str_replace_all(name, "\\.", "") # Remove periods
  name <- str_replace_all(name, "\\s+", " ") # Replace multiple spaces
  name <- str_trim(name)                  # Trim leading/trailing spaces
  return(name)
}



#====================================================================
#*********************************************************************************************
#***************************** GENDER DISTRIBUTION *******************************************
#*********************************************************************************************  


phd_gender <- as.data.frame(sort(table(phd$GENDER),decreasing = TRUE))

colnames(phd_gender) <- c('Gender','Count')

view(phd_gender)


ggplot( phd_gender, aes(x=`Gender`,y=`Count` , fill = as.factor(`Count`))) +
          geom_bar(stat = 'identity') +
          labs(title = "Gender Distribution",
               x = "Gender", y = "Count", fill = "Count")
        





#### PACKAGES TO INTERACTIVE VISUALIZATION
#install.packages("ggplot2")
install.packages("ggimage")
#install.packages("plotly")







# Add image URLs or file paths for icons
phd_gender$Image <- c(
  "C:/Users/HP/Downloads/trans.png",
  "https://cdn-icons-png.flaticon.com/512/432/432559.png",
  "https://cdn-icons-png.flaticon.com/512/432/432561.png"
  
)




library(ggplot2)
library(ggimage)
library(plotly)

# Create the base plot with ggplot2
gender_plot <- ggplot(phd_gender, aes(x = Gender, y = Count)) +
  geom_bar(stat = "identity", aes(fill = Gender), show.legend = FALSE, width = 0.6) + 
  geom_image(aes(image = Image), size = 0.1, by = "width") +  # Add icons
  scale_fill_manual(values = c("Male" = "blue", "Female" = "pink")) +
  labs(title = "Gender Distribution", x = NULL, y = "Count") +
  theme_minimal() +
  theme(
    text = element_text(size = 14),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    axis.text.x = element_text(face = "bold", size = 14),
    axis.text.y = element_text(size = 12)
  )

# Make the plot interactive with Plotly
interactive_plot <- ggplotly(gender_plot)

# Display the interactive plot
interactive_plot






# Static plot with icons using ggplot2
gender_plot <- ggplot(phd_gender, aes(x = Gender, y = Count)) +
  geom_bar(stat = "identity", aes(fill = Gender), show.legend = FALSE, width = 0.6) +
  geom_image(aes(image = Image), size = 0.1, by = "width") +
  scale_fill_manual(values = c("Male" = "blue", "Female" = "pink")) +
  labs(title = "Gender Distribution", x = NULL, y = "Count") +
  theme_minimal() +
  theme(
    text = element_text(size = 14),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    axis.text.x = element_text(face = "bold", size = 14),
    axis.text.y = element_text(size = 12)
  )

# Display the static plot
print(gender_plot)


library(plotly)

# Create the interactive bar chart with plotly
interactive_plot <- plot_ly(
  data = phd_gender,
  x = ~Gender,
  y = ~Count,
  type = "bar",
  text = ~paste0("Count: ", Count),
  hoverinfo = "text",
  marker = list(color = c("blue", "pink"), 
                line = list(color = "black", width = 1.5))
) %>%
  layout(
    title = "Gender Distribution",
    xaxis = list(title = ""),
    yaxis = list(title = "Count"),
    images = list(
      list(
        source = "https://cdn-icons-png.flaticon.com/512/432/432559.png", # Male icon
        xref = "x", yref = "y",
        x = "Male", y = 12000, # Position for the male icon
        sizex = 0.5, sizey = 3000, xanchor = "center", yanchor = "bottom"
      ),
      list(
        source = "https://cdn-icons-png.flaticon.com/512/432/432561.png", # Female icon
        xref = "x", yref = "y",
        x = "Female", y = 8000, # Position for the female icon
        sizex = 0.5, sizey = 3000, xanchor = "center", yanchor = "bottom"
      )
    )
  )

# Display the interactive plot
interactive_plot






  
#*********************************************************************************************  
#*********************************************************************************************  
#*********************************************************************************************  
#*********************************************************************************************  




phd <- distinct_df



#


nrow(phd)


#*************************************************************** 



# Load necessary libraries
library(dplyr)
library(tidyr)

# Check the structure of the dataset
str(phd)

# Ensure the relevant columns exist
# Columns we need: PROGRAMME.NAME and GENDER
if (!("PROGRAMME.NAME" %in% colnames(phd) && "GENDER" %in% colnames(phd))) {
  stop("Required columns (PROGRAMME.NAME and GENDER) are missing in the dataset.")
}


view(sort(table(phd$PROGRAMME.NAME)))







# Create the gender distribution table
gender_distribution <- phd %>%
  group_by(PROGRAMME.NAME, GENDER) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(PROGRAMME.NAME)

# View the result
print(gender_distribution)


view(gender_distribution)



gender_distribution_wide <- gender_distribution %>%
  pivot_wider(names_from = GENDER, values_from = Count, values_fill = 0)

# View the wide-format table

view(gender_distribution_wide)



  
write.csv(gender_distribution_wide, "C:/Users/HP/Downloads/all_programme_gender.csv")
  
  












