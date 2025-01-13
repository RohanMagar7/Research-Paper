#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)





view(data)


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


#--------------------------------- UG data analysis -------------------------------------------- 
ug_qualification_status <- sort(table(required_details$UG.QUALIFICATION.STATUS),decreasing = TRUE)
ug_passing_year <- sort(table(required_details$UG.PASSING.YEAR),decreasing = TRUE)


#ug_course_name <- sort(table(required_details$UG.COURSE.NAME), decreasing = TRUE) ## decreasing order 

# ug_subject_com <- sort(table(required_details$UG.SUBJECT.COMBINATION), decreasing = TRUE)
# remove(ug_subject_com)

# removing UG and PG subject combination( mix subjects were entered )
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

pg_passing_year <- sort(table(required_details$PG.Year.of.Passing.Appeared.Appearing.final.exam)
                        ,decreasing = FALSE)


view(pg_passing_year[1:10])
barplot(pg_passing_year[1:10])
barplot(pg_passing_year)
len_of_pg_pass_year <- length(pg_passing_year)

barplot(pg_passing_year[(len_of_pg_pass_year-5):len_of_pg_pass_year])


#----------------------------------------------------- 12th details 

twelth <- sort(table(required_details$XII.PERCENTAGE), decreasing = TRUE)

barplot(twelth[1:10] )

summary(required_details$XII.PERCENTAGE)

any(is.na(required_details$XII.PASSING.YEAR))

# there is no na vlaues in xii 

programme <- as.data.frame(sort(table(required_details$PROGRAMME.NAME), decreasing = TRUE)[1:10])

colnames(programme) <- c('programme Name','Enrolled Students')

view(programme)

# Bar plot: Count of students per program
ggplot(programme, aes(x = `programme Name`, y = `Enrolled Students`, fill = as.factor(`Enrolled Students`))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Count of Students Across Programs",
       x = "Program Name", y = "Number of Students", fill = "Enrolled Students")





install.packages("randomForest")

#------------------------ Random Forest analysis ___________________
library(randomForest)


require_data <- as.data.frame(required_details)

any(is.na(require_data$FAMILY.INCOME))

any(is.na(require_data$DOB.YEAR))

rf_model <- randomForest(PROGRAMME.NAME ~ XII.PERCENTAGE + 
                           DOB.YEAR + 
                         GENDER + 
                           CATEGORY +
                           FAMILY.INCOME ,
                         data = require_data, ntree = 100)

test <- predictions

remove(test)

predictions <- predict(rf_model, newdata = test)


confusionMatrix(predictions, test$ProgramName)

rf_model <- randomForest(ProgramName ~ UG_Marks + PG_Marks + Age + Gender, data = train, ntree = 100)
predictions <- predict(rf_model, newdata = test)
confusionMatrix(predictions, test$ProgramName)









#==================================================================================

# Predicting Scores based on Attendance and Age
model <- lm(Scores ~ Attendance + Age, data = dataset)
summary(model)

# Making predictions
predictions <- predict(model, newdata = test_data)




model <- lm(XII.PERCENTAGE ~ PROGRAMME.NAME 
            + GENDER + CATEGORY ,  data = required_details )

summary(model)

view(model)


predictions <- predict(model)

view(predictions)

barplot(predictions)




#==================================
  
  
#=======================================================================
  











#############


# Select relevant columns
clustering_data <- require_data[, c("XII.PERCENTAGE", "UG.PERCENTAGE", "PG.PERCENTAGE")]
clustering_data <- scale(clustering_data)



any(is.na(require_data$XII.PASSING.YEAR))
# in xii exampe no one haivng na values 


any(is.na(require_data$UG.PERCENTAGE))
any(is.na(require_data$PG.PERCENTAGE))
# but the pg and ug are having NA values first we have to tackele it 
# otherwise it won't be working !!!!


# K-Means
set.seed(123)


kmeans_result <- kmeans(clustering_data, centers = 3)
dataset$Cluster <- kmeans_result$cluster

# Visualize
library(factoextra)
fviz_cluster(kmeans_result, data = clustering_data)







  
