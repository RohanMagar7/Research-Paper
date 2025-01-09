

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







# data type
class(data$GENDER)








###############################################
###############################################
###############################################
###############################################
###############################################












