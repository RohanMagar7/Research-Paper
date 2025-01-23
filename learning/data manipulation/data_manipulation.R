# create a sample data frame
df <- data.frame(
  Name = c('alice','bob','charlie','david','eve'),
  Age = c(23,34,29,40,45),
  Score = c(88,92,95,80,85)
)
df


# selection a comn by name
df$Age


# selecting multiple columns
df[,c("Name","Score")]


# Filtering rows based on a dondition
df[df$Age > 30,]


# 2 . Addning and Removing Colusmn
# Addomg a mew column

# adding a new colun
df$passed <- df$Score > 85
df

# Removing a column
df$passed <- NULL
df


# sorting DAta 
# sort by Age in ascending order
df_sorted <- df[order(df$Age),]
df_sorted


# sorting by score is descending order
df_sorted <- df[order(-df$Score),]
df_sorted


# aggregating









