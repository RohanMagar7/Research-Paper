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



# Adding Layers to Your plot
# 1. faceting: create multiple panes form each catory.
ggplot(df,aes(x = Age, y = Score)) +
  geom_point() +
  facet_wrap( ~ Name )











