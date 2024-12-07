install.packages("stringdist")


library(ggplot2)
library(stringdist)

bamu

# Check unique college names
unique_colleges <- unique(bamu$UG.INSTITUTE.COLLEGE)
length(unique_colleges)  
nrow(unique_colleges)
ncol(unique_colleges)
length(unique_colleges)
view(unique_colleges)


View(str(bamu))




# Sample data frame
df <- data.frame(
  ID = 1:10,
  Age = c(25, 30, 22, 35, 40, 29, 21, 23, 27, 32),
  Gender = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F")
)


print(df)
# Subset rows where Age > 25
subset(df, Age >25)


# Subset rows where Gender is 'F' and keep only ID and Age
subset(df, Gender == "F", select = c(ID, Age))



subset(df,Age> 25 & Gender == "M")



vec <- c(1,2,3,4,5,6)
subset(vec,vec>3)

subset(df,select = c(ID,Gender))




# Inner join
# Example data
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(ID = c(2, 3, 4), Score = c(90, 85, 88))

merge(df1,df2,by ='ID')



# Keeps all rows from df1 and adds matching rows from df2


merge(df1,df2,by='ID',all.x = TRUE,Score = mean(df2$Score))


# Left join
merge(df1, df2, by = "ID", all.x = TRUE)






# Right join
merge(df1,df2,by='ID',all.y = TRUE)




# Full outer Join

merge(df1,df2,by='ID',all = TRUE)

merge(df1,df2,by='ID',all.x = TRUE,all.y = TRUE)





# Using Different Key Names 

df3 <- data.frame(UserID = c(2, 3, 4), Score = c(90, 85, 88))


merge(df1, df3, by.x = "ID", by.y = "UserID")



# Mergin Multiple Columns
df4 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"), Age = c(25, 30, 35))

merge(df1,df4, by=c('ID','Name') )


# The functions rbind() and cbind() in R are used to combine data structures by rows and columns, respectively.



v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

# Combine vectors as rows
rbind(v1, v2)

v1
v2

df1 <- data.frame(ID = 1:3, Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(ID = 4:5, Name = c("David", "Eve"))


df1
df2
rbind(df1,df2)


# Handling column Names 
# If column names differ, rbind() will align by names and insert NA for missing columns.

df3 <- data.frame(ID = 6:7, Age = c(25, 30))
rbind(df1, df3)

# cbind() : Purpose: Combines data structures (e.g., vectors, matrices, data frames) column-wise.

v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

cbind(v1,v2)


df1 <- data.frame(ID = 1:3, Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(Age = c(25, 30, 35), Score = c(90, 80, 85))


cbind(df1,df2)

v3 <- c(7, 8)

cbind(v1,v3)












