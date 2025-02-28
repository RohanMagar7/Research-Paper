set.seed(1240352)
iris[,1:4] <- scale(iris[,1:4])
setosa <- rbind(iris[iris$Species == 'Setosa',])
veriColor <- rbind(iris[iris$Species == 'versiColor',])
verginica <- rbind(iris[iris$Species == 'Verginica',])
ind <- sample(1: nrow(setosa),nrow(setosa) * 0.8)

iris.train <- rbind(setosa[ind,],veriColor[ind,],verginica[ind,])
iris.test <- rbind(setosa[-ind,],veriColor[-ind,], verginica[-ind,])
iris[,1:4] <- scale(iris[,1:4])


library(class) 

error <- numeric(15)
for (i in 1:15) {
  knn.fit <- knn(train = iris.train[, 1:4], 
                 test = iris.test[, 1:4], 
                 cl = iris.train$Species, 
                 k = i)  
  
  error[i] <- 1 - mean(knn.fit == iris.test$Species) 
}


ggplot(data = data.from(error), aes(x = 1:15, y = error))+
  geom_line(color = 'blue')




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

