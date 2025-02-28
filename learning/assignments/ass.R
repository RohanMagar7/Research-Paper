library(ggplot2)
iris <- iris

summary(iris)

#calculate standard deviation
apply(iris[, 1:4], 2, sd)  

par(mar = c(4, 4, 2, 1))  
par(mfrow = c(2, 2))  

hist(iris$Sepal.Length, col = 'blue', breaks = 10, main = "Sepal Length")
hist(iris$Sepal.Width, col = 'blue', breaks = 10, main = "Sepal Width")
hist(iris$Petal.Length, col = 'blue', breaks = 10, main = "Petal Length")
hist(iris$Petal.Width, col = 'blue', breaks = 10, main = "Petal Width")

par(mfrow = c(1,1)) 



# plot scatter plot
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point()


ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point()



library(caret)
cm <- confusionMatrix(predictors, iris$Species)

