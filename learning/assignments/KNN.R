# Load required packages
library(class)     # For KNN
library(ggplot2)   # For visualization
library(caret)     # For dataset splitting
library(dplyr)     # For data manipulation
library(ggplot2)   # For visualization
library(cowplot)   # For arranging multiple plots

# Load Iris dataset
data(iris)

# Normalize function (scaling features)
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Apply normalization to the first four columns (features)
iris_norm <- as.data.frame(lapply(iris[,1:4], normalize))


# Add the Species column back
iris_norm$Species <- iris$Species

View(iris_norm)

# Split into train and test sets (80% train, 20% test)
set.seed(123)
train_index <- sample(1:nrow(iris), 0.8 * nrow(iris))


train_data <- iris_norm[train_index, ]
test_data  <- iris_norm[-train_index, ]


# Separate features and labels
train_x <- train_data[,1:4]
train_y <- train_data$Species
test_x  <- test_data[,1:4]
test_y  <- test_data$Species


# Train KNN model with K=5
knn_pred <- knn(train = train_x, test = test_x, cl = train_y, k = 5)

# Evaluate model accuracy
accuracy <- mean(knn_pred == test_y)
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%"))


# Create a grid for plotting decision boundary
plot_knn <- function(k_value) {
  # Generate a grid of values
  x_range <- seq(min(iris$Sepal.Length), max(iris$Sepal.Length), by = 0.1)
  y_range <- seq(min(iris$Sepal.Width), max(iris$Sepal.Width), by = 0.1)
  
  grid <- expand.grid(Sepal.Length = x_range, Sepal.Width = y_range)
  
  # Normalize grid data
  grid_norm <- as.data.frame(lapply(grid, normalize))
  
  # Predict class for each grid point
  grid_pred <- knn(train_x[, 1:2], grid_norm, train_y, k = k_value)
  
  # Convert prediction to dataframe
  grid$Species <- as.factor(grid_pred)
  
  # Plot decision boundary
  ggplot() +
    geom_point(data = grid, aes(x = Sepal.Length, y = Sepal.Width, color = Species), alpha = 0.2) +
    geom_point(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species), size = 3) +
    labs(title = paste("KNN Decision Boundary (k =", k_value, ")"),
         x = "Sepal Length", y = "Sepal Width") +
    theme_minimal()
}

# Visualize for K = 5
plot_knn(5)



# Finding the best K using error rate
error_rate <- numeric(15)

for (k in 1:15) {
  pred_k <- knn(train_x, test_x, train_y, k)
  error_rate[k] <- mean(pred_k != test_y)
}

# Plot error rate vs. K
ggplot(data.frame(K = 1:15, Error = error_rate), aes(x = K, y = Error)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Elbow Method for Optimal K", x = "Number of Neighbors (K)", y = "Error Rate") +
  theme_minimal()






#)__+++++++++++++++++++++++++++++++++++

set.seed(123)
runif(3)
#+++++++++++++++++++++++++++++++++++++++++++++


loan <- read.csv('F:/R programming/learning/assignments/learning dataset/german.csv')
head(loan)



loan <- read.csv('F:/R programming/learning/assignments/learning dataset/loan.csv')

library(dplyr)

loan_subset <- loan %>%
  select(bank_asset_value, no_of_dependents, education , self_employed
         ,income_annum , loan_amount , loan_term , cibil_score, residential_assets_value,
         commercial_assets_value ,luxury_assets_value , bank_asset_value , loan_status
         )

loan_subset <- as.data.frame(loan_subset)


normalize <- function(x){
  return((x-min(x))/(max(x)) - (min(x)) )
  
}

loan_subset$bank_asset_value <- apply(loan_subset[, "bank_asset_value", drop = FALSE], 2, normalize)

loan_subset$residential_assets_value <- apply(loan_subset[,'residential_assets_value', drop=FALSE], 2 , normalize)

loan_subset$income_annum <- apply(loan_subset[,'income_annum',drop=FALSE], 2, normalize)

loan_subset$loan_amount <- apply(loan_subset[,'loan_amount',drop = FALSE] , 2 , normalize)

loan_subset$commercial_assets_value <- apply(loan_subset[,'commercial_assets_value', drop = FALSE], 2, normalize)

loan_subset$cibil_score <- apply(loan_subset[,'cibil_score' , drop = FALSE] , 2, normalize)

loan_subset$loan_term <- apply(loan_subset[,'loan_term',drop = FALSE] , 2, normalize)

loan_subset$luxury_assets_value <- apply(loan_subset[,'luxury_assets_value', drop = FALSE] ,2 ,normalize)






loan_subset$bank_asset_value <- loan_sub


self_employed <- as.numeric(as.factor(loan_subset$self_employed))

self_employed
loan_subset$education <- edu


loan_subset <- loan_subset %>%
  mutate(loan_stat)



loan_subset$loan_status <- ifelse(loan_subset$loan_status == "Approved", 1, 0)


category <- function(category) {
  ifelse(trimws(tolower(category)) == "approved", 1, 0)
}

grad <- function(grad){
  ifelse(trimws(tolower(grad)) == 'graduate', 1 , 0)
}

cat <- apply(loan_subset[, "loan_status", drop = FALSE], 2, category)
View(cat)

selfemp <- function(category){
  ifelse(trimws(tolower(category)) == 'yes' , 1 , 0 )
}
loan_subset$self_employed <- apply(loan_subset[,'self_employed',drop = FALSE] , 2, selfemp)



graduation <- apply(loan_subset[,"education" , drop=FALSE] , 2, grad)
View(graduation)

loan_subset$loan_status <- cat
loan_subset$education <- graduation

View(loan_subset)


set.seed(123)
dat.d <- sample(1:nrow(loan_subset))

loan_subset <- as.matrix(loan_subset)
loan_subset <- as.data.frame(loan_subset)

colnames(loan_subset) <- c("bank_asset_value", "no_of_dependents", "education" , "self_employed"
                           ,"income_annum" , "loan_amount" , "loan_term" , "cibil_score", "residential_assets_value",
                           "commercial_assets_value" ,"luxury_assets_value" , "bank_asset_value" , "loan_status")




############################################+++++++++++++++++++++++++++++++++++++++++++++++

path <- 'F:/R programming/learning/assignments/learning dataset/snads.csv'

dataset <- read.csv(path)


sub <- dataset[3:5]
sub$Purchased <- factor(sub$Purchased , levels= c(0,1))
head(sub)
View(sub)

install.packages("caTools")
library(caTools)
library(class)


set.seed(123)
split_d <- sample.split(sub$Purchased, SplitRatio = 0.75 )
 
sub.train <- subset(sub,split_d == TRUE)
sub.test <- subset(sub,split_d == FALSE)

nrow(sub.train)
nrow(sub.test)
nrow(sub)

View(sub)

###3 Feature scaling 

sub.train[-3] <- scale(sub.train[-3])
sub.test[-3] <- scale(sub.test[-3])

View(sub.train)

pre <- knn(train = sub.train[-3],test = sub.test[-3], cl = sub.train[,3], k = 5 )


### create confusion matrix 
confmatrix <- table(sub.test[,3],pre)
confmatrix


################+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# steps to pe


#1 scale the dataset
iris[,1:4] <- scale(iris[,1:4])



View(iris)

# step 2.  split dataset into training ( 80% ) and testing ( 20 % )

set.seed(123)
trainIndex <- createDataPartition()

library(caTools)

# split by dependent variable 
split_data <- sample.split(iris$Species , SplitRatio = 0.75)
iris.train <- subset(iris,split_data == TRUE)
iris.test <- subset(iris,split_data == FALSE)

















