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



# Histogram for Maximum Daily Temperature

hist(airquality$Temp , main = 'La Guardia Airports Maximum Temperature(daily)',
     xlab = 'Temperature(Fahrenheit',
     xlim = c(50, 125), col = 'yellow',
     freq = TRUE
     )



boxplot(airquality$Wind, main = 'Average wind speed at 
         \ at La Guardia Airport',
        xlab = 'Miles per hour ', ylab = 'wind',
        col = 'orange', border = 'brown',
        horizontal = TRUE,notch = TRUE
        )


worldcities


df <- data.frame(world.cities)



# Load the required libraries
library(maps)
map(database = "world")

# marking points on map
points(x = df$lat[1:500], y = df$lng[1:500], col = "Red")





# Adding Titles and Labeling Axes to Plot
cone <- function(x, y){
  sqrt(x ^ 2 + y ^ 2)
}

# prepare variables.
x <- y <- seq(-1, 1, length = 30)
z <- outer(x, y, cone)

# plot the 3D surface
# Adding Titles and Labeling Axes to Plot
persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab = "Height",
      theta = 30, phi = 15,
      col = "orange", shade = 0.4)














