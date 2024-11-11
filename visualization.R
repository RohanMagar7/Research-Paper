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



# colors and shapes : Customize colors or shapes bases on another vairable.
ggplot(df, aes(x = Age, y = Score, color= Name, shape = Name)) + 
  geom_point(size = 3)




# Theme Modify the appearance fo your plot

ggplot(df, aes(x = Age, y = Score)) + 
  geom_point() +
  theme_minimal() +
  labs(title = 'Scatter plot with Minimal Theme')




# Title , labels, and Legends : Add custom title , Axis labesl, and adjust legends,

ggplot(df, aes(x = Age, y = Score)) + 
  geom_point(color = 'darkgreen') +
  labs (
    title = 'Scatter plot of Age vs. Score',
    subtitle ='A closer look at the relationship between Age and Score',
    x = 'Age',
    y = 'Score'
  )



airquality


barplot(airquality$Ozone,
        main = 'Ozone concentration in air',
        xlab = 'Ozone levels', horiz = FALSE
        )






