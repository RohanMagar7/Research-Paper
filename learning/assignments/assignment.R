#Plot the given data
iris <- iris

# Plot the data
plot(iris)

# Summary of the given data
summary(iris)

# Histogram of the data
hist(iris$Sepal.Width)




library(tidyverse)
# load the downloaded dataset
dataset <- read.csv('F:/R programming/learning/assignments/learning dataset/college.csv')


head(dataset)
view(dataset)
class(dataset)
str(dataset)





#load required library
library(e1071)

#Create first matrix
A = matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3)
#Create second matrix
B = matrix(c(7,8,9,10,11,12),nrow = 2, ncol = 3)

sum = A + B
sub = A - B
mul = A * B
div = A / B

print(sum)
print(sub)
print(mul)
print(di
tens <- array(1:24,dim=c(2,3,4))

print(tens)

matrix_2d <- matrix(1:4, nrow=2)
print(matrix_2d)

vector_1d <- as.vector(matrix_2d)
print(vector_1d)

#3d to 1d
#create a 3D matrix
matrix_3d <- array(1:24,dim =c(3,4,2))
print(matrix_3d)

#convert the matrix 3D to 1D vector 
vector_1d <- as.vector(matrix_3d)
vector_1d



my_vector <- c(c,4,5,3,6,8,10,12)

#length

cat('length of the vector is : ',length(my_vector))



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# import libraries in R programming 
# Note : If not install already install it ✅
library(class)  
library(ggplot2)
library(caret)  


# 👀✅  :Load and  Prepare  Data 

# Load the built-in Iris dataset
data(iris)

# Scale numeric features (standardize to mean=0, std=1)
iris[, 1:4] <- scale(iris[, 1:4])

# Split dataset into training (80%) and testing (20%)
set.seed(123)  # Ensure reproducibility
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
iris.train <- iris[trainIndex, ]
iris.test <- iris[-trainIndex, ]




# Extract predictor variables (❌) and target labels (y✅)
trainX <- iris.train[, 1:4]
trainY <- iris.train$Species
testX <- iris.test[, 1:4]
testY <- iris.test$Species


## ✅ Apply  KnNN
# Choose K = 5 (default value)
k_value <- 5

# Perform KNN classification
knn.pred <- knn(train = trainX, test = testX, cl = trainY, k = k_value)

# Print predictions
print(knn.pred)


# 🔗 Evaluate Model
# Create a confusion matrix
conf_matrix <- table(Predicted = knn.pred, Actual = testY)
print(conf_matrix)

# Calculate accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))


# ♾ 🥉 Find optimal "k"

# Finding the best K value
error_rate <- numeric(15)
error_rate

for (k in 1:15) {
  knn.pred <- knn(train = trainX, test = testX, cl = trainY, k = k)
  error_rate[k] <- mean(knn.pred != testY)  # Misclassification rate
}

# Convert to dataframe for plotting
error_df <- data.frame(K = 1:15, Error = error_rate)

# Plot K vs Error Rate
ggplot(error_df, aes(x = K, y = Error)) +
  geom_line(color = 'blue') +
  geom_point(color = 'red') +
  ggtitle("Error Rate vs K in KNN") +
  xlab("K (Number of Neighbors)") +
  ylab("Error Rate") +
  theme_minimal()
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







