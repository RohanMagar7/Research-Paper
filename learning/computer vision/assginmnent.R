# to load the given dataset

plot(iris)


summary(iris)


# plot histogram of the data
hist(iris$Sepal.Width )

View(iris)
library(ggplot2)

sepalwidth <- table(iris$Sepal.Width)


sepalwidth <- data.frame(sepalwidth)
colnames(sepalwidth) <- c('sepalwidth','frequency')

View(sepalwidth)

hist(iris$Sepal.Width)

ggplot(sepalwidth,aes(x=`sepalwidth`,y=`frequency`))+
  geom_histogram(stat = 'identity', binwidth = 5, bins = 2) +
  labs(title = 'Sepal width Distribution', x = 'Sepal Width' , y = 'Frequency', fill ='Frequency')

  
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.2, color = 'black') +
  labs(title = 'Sepal Width Distribution', x = 'Sepal Width', y = 'Frequency')

  

ggplot(sepalwidth, aes(x = sepalwidth, y = frequency)) +
  geom_bar(stat = 'identity', fill = 'green', width = 1) +
  labs(title = 'Sepal Width Distribution', x = 'Sepal Width', y = 'Frequency')

  
  
pl <- iris$Petal.Length
pw <- iris$Petal.Width

plot(pl)
plot(pw)
plot(pl,pw)

plot(pw,pl)




##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



pl <- iris$Petal.Length
pw <- iris$Petal.Width
Species <- as.numeric(iris$Species)

View(iris)
Species

# plot petal length vs petal width
plot(pl,pw,
     xlab = 'petal length',
     ylab = 'petal width',
     main = 'petal width vs petal length',
     pch = Species,
     
     )
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# Load dataset
data(iris)

# Define colors and shapes for each species
colors <- c("setosa" = "red", "versicolor" = "green", "virginica" = "blue")
shapes <- c("setosa" = 16, "versicolor" = 17, "virginica" = 18)

# Create scatter plot with colors and shapes
plot(iris$Petal.Length, iris$Petal.Width,
     col = colors[iris$Species], # Assign colors by species
     pch = shapes[iris$Species], # Assign shapes by species
     xlab = "Petal Length (cm)",
     ylab = "Petal Width (cm)",
     main = "Petal Width vs Petal Length by Species",
     cex = 1.2) # Increase point size

# Add legend
legend(x=5,y=2,
       legend = names(colors),
       col = colors,
       pch = shapes,
       title = "Species",
       bty = "n") # Remove border around legend

###++++++++++++++++++++++++++++++++++++++++++++++


### calculate standar deviation

stamdard_deviation <- apply(iris[1:4], 2, sd)
meanOf_data <- apply(iris[1:4],2,mean)
sum_of_data <- apply(iris[1:4],2,sum)


stamdard_deviation
sum_of_data
meanOf_data

par(mfrow = c(1,1))
hist(iris$Sepal.Length, col = 'green', breaks = 20)
hist(iris$Sepal.Width , col = 'green',breaks = 20)
hist(iris$Petal.Length, col = 'green' , breaks = 20)
hist(iris$Petal.Width, col = 'green' , breaks = 20)



# plot scatter plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width , col= Species )) +
  geom_point()


ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col=Species)) + 
  geom_point()





library()
































  