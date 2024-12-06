# here is basic structure for defining a function
my_function <- function(arg1,arg2=10){
  # code to be executed
  result <- arg1 * arg2
  return(result)
}

print(my_function(10,arg2 = 100))


facto <- function(n){
  if(n == 0){
    return(1)
  }
  current_fac <- n * facto(n-1)
  return(current_fac)
}

sprintf("the factorial of 5 is %s : ",facto(5))


check_even_odd <- function(n){
  if( n %% 2 == 0 ){
    return(paste(n , " is even number",n))
  } else {
    return(paste(n,"is odd number"))
  }
}

print(check_even_odd(7))



pow <- function(n){
  return(n^3)
}

print(pow(3))

# higher order functions lapply
numbers <- list(1,2,3,4,5)

squared_numbers <- sapply(numbers,function(n) return(n ^ 2) )
print(squared_numbers)


# variable length arguments
sum_all <- function(...){
  return(sum(...))
}

print(sum_all(50,10,20,20))



# controll structure 



# loops in R 
# for loop 

for (i in 1:5){
  if(i %% 2 == 0 ){
    print(i)
  }
}

# Prompt the user for input
user_input <- as.numeric(readline(prompt = "Please enter your name: "))

# Print the input
cat("Hello,", user_input, "!\n")



get_numric_input <- function(){
  repeat {
    input <- readline(prompt = 'enter a number : ');
    number <- as.numeric(input)
    
    if(!is.na(number)){
      return(number)
    } else {
      cat('Invalid Input, Please enter a valid number . \n')
    }
  }
  
}

print(get_numric_input())


# prompt for multiple inputs in one line
user_inputs <- strsplit(readline(prompt='enter your number seperated by spaces : ')," ")[[1]]


# Convert to numeric 
user_numbers <- as.numeric(user_inputs)


# Print the inptus 
cat("You entered the numbers ", user_numbers )



count <- 1

repeat {
  print(count)
  count <- count + 1
  if (count > 5) {
    break
  }
}

for (i in 1:10) {
  if (i == 5) {
    break
  }
  print(i)
}


check_number <- function(n){
  if(n > 0 ){
    print('Positive')
  } else if ( n < 0 ){
    print('number is negetive')
  } else {
    print('number is zero')
  }
}

check_number(10)


# Core data Manipulation Tasks

df <- data.frame(
  Name = c('pooja','pillu','Pranav'),
  age = c(22,22,23),
  score  = c(99,99,85)
)


df$Name[2]
df$Name


df[df$age  < 23,]


# adding and removing columns
# adding a new column 
df$Passed <- df$score > 85
print(df)

# Removing Column 
df$Passed <- NULL
print(df)



# sorting Data 
# SORTING DATA USING order() function


# sort by Age in ascending order
df_sorted <- df[order(df$age)]
print(df_sorted)


# calculating the mean score by age
aggregate(score ~ age , data = df, mean)

# The dplyr package is one of the most powerful tools in R 
# for data manipulation. Here are some of its key functions:

# select() : Choose specific columns.
# filter() : Filters rows based on a condition.
# mutate() : Add new column or modify existing ones.
# arrange() : Sort data by a column
# summarize() : Create summary statistics for columns
# group_by() : Group data by a column


library(dplyr)



# selecting columns with select()
df %>% select(Name, score,age)



#Filtering Rows with filter()
df %>% filter(age < 23)


make_attendance <- function(score){
  if(score > 85 ){
    return(TRUE)
  } else {
    return(FALSE)
  }
}


# Adding New column with mutate()
df %>% mutate(Passed = score > 85)
df %>% mutate(Attendance = score > 85 )



# sorting data with arrange()

df %>% arrange(score)
df %>% arrange(desc(score))


# Grouping And Summarizing with group_by() and summarize()


df %>% 
  group_by(age) %>%
  summarise((mean_score = mean(score)))



# Let's continue with advanced data manipulation techniques
# using dplyr and introduce some data reshaping concepts using 
# tidyr


# Advanced Data Manipulation with dplyr

# Chaning operaiotns with the pipe operator %>% 

df %>% 
  filter(age < 23) %>% 
  select(Name,score) %>% 
  arrange(score)


# using case_when() for complex conditions 

df <- df %>% 
  mutate(
    Grade = case_when(
      score >= 90 ~ 'A',
      score >= 80 ~ "B",
      TRUE ~ "C"
    )
  )
df



# Joining DAta Frames 
# Dplyr provides functions to join 
# data frames : left_join(), right_join(), inner_join(),
#  and full_join(). These are similar to SQL joins 

df1 <- data.frame(Name = c('Pranav','Pooja'),
                  Age = c('22','23')
                  )
df2 <- data.frame(
    Name = c('Pooja','Pranav'),
    Score = c(92,33)
)

# Perform a left join on the Name column 
result <- left_join(df1,df2,by = "Name")

print(result)



# Windows functions like lag() , lead () , and ranking functions 
# ()
df <- df %>%
  arrange(age)%>%
  mutate(
      Prev_score = lag(score) ,
      Next_score = lead(score)
)
df

  
# The tidyr package, also part of the tidyverse, is designed 
# for reshaping data, which is crucial for 
# preparing datasets for analysis or visualization. Here 
# are some key functions:


# 1. pivot_longer()


  # Conversts wide-format data to long format, where column
# are combined into key-vlaue pairs.

# Wide data
df <- data.frame(
  Name = c('pranv','pooja'),
  Math = c(88,92),
  Science = c(94,99)
)




# Wide data
df <- data.frame(
  Name = c("Sunil", "Alice",'pooja','pranav'),
  Age = c(22, 21,22,23),
  Score = c(35,85,99,98),
  Math = c(35, 85,99,98)
)
df


#install.packages("ggplot2")


# importing the libraray
library(ggplot2)

ggplot(data = df , aes(x = Name , y = Math)) +
  geom_point()

aes()


# scatter plot
ggplot(df,aes(x = Name, y= Math)) +
  geom_point(color = "blue",size = 3) +
  labs(title = 'Scatter plot of Name vs. Score',x= 'Age',y='Score')

# Line Plot
ggplot(df,aes(x=Age,y=Score)) +
  geom_line(color = 'red') + 
  labs(title = "line plot of Age Vs. Score ", x = 'Age', y = 'Score')



# Bar plot 
ggplot(df,aes(x = Name, y= Score)) + 
  geom_bar(stat = 'identity', fill ='skyblue') +
  labs( title = 'Bar plot of scores by names ', x = "name", y = 'Score')



# Histrogram 

ggplot(df,aes(x = Score)) + 
  geom_histogram(binwidth = 5, fill = 'orange',color='black') + 
  labs( title = 'histogram of Scores ', x = 'Score',y='Frequence')





# Box Plot 
ggplot(df,aes(x = factor(0), y = Score)) + 
  geom_boxplot(fill = 'purple') + 
  labs(title = 'box plto of score ', x = '', y = 'Score')









