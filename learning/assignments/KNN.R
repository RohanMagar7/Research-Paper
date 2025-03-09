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


