

###############################################

# import tidyverse library
library(tidyverse)


# import the data 
# already present in the local machine

# rows and columns
dim(data)


str(data)


glimpse(data)

# in the table format
view(data)

# first 6 rows 
head(data)

# last 6 rows 
tail(data)


attach(data)


# all the column names
names(data)


# row length ( how many columns are there)
length(data)

# all the gender count (18736)
length(data$GENDER)

# unique gender 
unique(data$GENDER)
# Male , FEMALE , TRANSGENDER 


# unique programmes
unique(data$PROGRAMME.NAME)


# count of unique programmes ( 167 )
length(unique(data$PROGRAMME.NAME))





# create table of programmes names with their counts 
view(sort(table(data$PROGRAMME.NAME),decreasing = TRUE))


# convert as dataframe
programmeTable <- as.data.frame(sort(table(data$PROGRAMME.NAME),decreasing = TRUE))


# change the column names 
colnames(programmeTable) <- c('programme Name', 'enrolled students')




view(programmeTable)



barplot(sort(table(data$PROGRAMME.NAME),decreasing = TRUE))


# arranging the data descending 
topten <- sort(table(data$PROGRAMME.NAME),decreasing = TRUE)

# getting top 10 programmes
topten <- topten[1:10]



barplot(sort(table(data$PROGRAMME.NAME),decreasing = TRUE))

view(topten)

# plotting top 10 programmes 
barplot(topten)

# data type
class(data$GENDER)



programmeTable <- as.vector(programmeTable)

view(programmeTable)

programmeTable %>% 
  select(PROGRAMME.NAMES) %>%
  count(PROGRAMME.NAMES) %>%
  arrange(desc(n)) %>%
  view()
  
  





###############################################
###############################################
###############################################
###############################################
###############################################












