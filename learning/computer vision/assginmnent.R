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

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


library(class)
library(ggplot2)
library(caret)


# scale numetic features ( standardized to ) mean = 0, std = 0
iris[,1:4] <- scale(iris[,1:4])


#split dataset into trainig ( 80% ) and testing ( 20% )

set.seed(123)
trainIndex <- createDataPartition(iris$Species , p=0.8 , list = FALSE)
iris.train <- iris[trainIndex,]
iris.test <- iris[-trainIndex,]


# Extract predictor variable ( x ) and taraget labels ( y )
trainX <- iris.train[,1:4]
trainY <- iris.train$Species
testX <- iris.test[,1:4]
testY <- iris.test$Species


# apply knn classficiation 
# choose k = 5(default value) 

k_value <- 5 

# perform KNN classfication 
knn.pred <- knn(train = trainX, test = testX , cl = trainY, k = k_value)



# Print predictions 
print(knn.pred)


# Evaluate model performance 
#Create a confusion matrix 

confusion_matrix <- table(predicted = knn.pred , 
                          actual = testY)
print(confusion_matrix)

# calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

print(paste("accuracy",round(accuracy* 100 , 2) , '%'))


# find the optimal K using Error rate findnig the best K value
error_rate <- numeric(15)

for (k in 1:15){
  knn.read <- knn(train = trainX , test = testX , cl = trainY , k = k )
  error_rate[k] <- mean(knn.pred != testY)
}

# convert to dataframe for plotting 
error_df <- data.frame(k = 1: 15 , Error = error_rate)

# plot k vs error rate 
ggplot(error_df, aes(x = k , y= Error)) + 
  geom_line(color = 'blue') + 
  geom_point(color = 'red') + 
  ggtitle('Error Rate Vs K in in Knn ') + 
  xlab('K ( Number of Neighbor)') + 
  ylab('Error Rate') + 
  theme_minimal()

#++++++++++++++++++++++++++++++++++++++






















































  