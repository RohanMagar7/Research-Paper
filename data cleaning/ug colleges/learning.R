expanded_path <- path.expand('-')

# import the libraries ---------------------------------------------------------
library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(ggplot2)


# import the libraries ---------------------------------------------------------
expanded_path


demo()

demo(graphics)



# getting working directory ----------------------------------------------
wkdir <- getwd()



# setting working directory
setwd('F:/R programming/data cleaning/ug colleges')


getwd()


dir()

dir(pattern = '.txt')       

dir(pattern = '.R')   

file.exists('bamudb.R')

newdirPath <- 'createdbycode'

if ( file.exists(wkdir)) dir.create(newdirPath)

dir(pattern = 'create')

# creating a file
file.create('learning.R')

# getting working directory ----------------------------------------------


ggplot(data=diamonds,aes(x=price))+
  geom_histogram()



ggplot(data=diamonds,aes(x=price))+
  geom_histogram(fill='green',col='orange')


ggplot(diamonds,aes(x=price))+
  geom_bar()


ggplot(data = diamonds,aes(x=cut,fill = cut))+
  geo_bar()



view(diamonds)


ggplot(data = diamonds,aes(x=carat,y=price,col=cut))+
  geom_point()



ggplot(data=diamonds,aes(x=clarity,y=carat)) +
  geom_boxplot()


ggplot(data=diamonds,aes(x=clarity,y=carat,fill=cut))+
  geom_boxplot()




clean$data <- diamonds[!duplicated(data),]

view(clean)

view(clean$data)


#=================================================================

# remove duplicates 
duplicate <- bamudb$PROGRAMME.NAME
cleandata <- duplicate[!duplicated(duplicate)]
view(cleandata)



# Explore how duplicated() flags dulicate rows 

# Experiment with growing variables to identify duplicates in specific columns 

#=================================================================

# Handle Missing DAta


df <- data.frame(bamudb)

duplicates <- df[duplicated(df$PROGRAMME.NAME),]

duplicates <- bamudb[duplicated(bamudb),]

View(duplicates)

#=================================================================



# Find the column number for "Age"

column_number <- which(colnames(bamudb) == "NAME.OF.THE.APPLICANT")

column_number


View(head(bamudb))



# View basic structure
dim(bamudb) # Check dimensions (rows and columns)
str(bamudb) # View structure of the dataset




colnames(bamudb)



# N======================= SEarch Name from a table =====================
partial_name <- "pranav"
result <- bamudb[grepl(partial_name, data$NAME.OF.THE.APPLICANT, ignore.case = TRUE), ]
result
View(result)

# N======================= SEarch Name from a table =====================

#................ get the missing cOlumns and missing counts 

sum(is.na(bamudb))        # Total missing values
colSums(is.na(bamudb))    # Missing values per column
View(length(colSums(is.na(bamudb))))


# N===================================== =================================
# ----------- remove those columns where all the values are NA ----------------

# Remove columns where all values are NA
View(colSums(is.na(bamudb)))

data_cleaned <- bamudb[, colSums(!is.na(bamudb)) == 18736]

# Print the result
print(data_cleaned)
View(data_cleaned)
summary(data_cleaned)
View(summary(data_cleaned))
nrow(data_cleaned)
ncol(data_cleaned)

### NOW CAN SEE THE THERE ARE ONLY 152 COLS ARE THER REMOVED UNWANTED REST OF THE COLUMNS 
# ............. EARLIER WE HAD 815 COLUMNS 

# N===================================== =====================



vari <- aggregate(Scores ~ Gender, data = bamudb, FUN = mean)


table(bamudb$GENDER)


programmes <- table(bamudb$PROGRAMME.NAME)
View(table(bamudb$PROGRAMME.NAME))

programmes <- data.frame(programmes)

View(arrange(desc(programmes)))


# N===================================== =====================
# N===================================== =====================
# N===================================== =====================
# N===================================== =====================


### 









