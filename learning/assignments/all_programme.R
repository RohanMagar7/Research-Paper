mode_value = names(which.max(table(data)))
###@@@@
e1071
# Define colors for species
species_colors <- c("setosa" = "red", "versicolor" = "blue", "virginica" = "green")
# Add legend
legend("topright", legend=names(species_colors), 
       col=species_colors, pch=19, title="Species")
#+++++++++++++++++++++++++++++++++++++++PCA ( PRINCIPLE COMPONENT ANALYSIS)
# Load dataset
data(iris)

# Remove categorical column (Species) and scale numeric data
iris_pca <- prcomp(iris[, 1:4], center=TRUE, scale=TRUE)

# Step 1: Standard Deviation of Principal Components
std_dev <- iris_pca$sdev
print("Standard Deviation of Principal Components:")
print(std_dev)

# Step 2: Proportion of Variance Explained
prop_var <- (std_dev^2) / sum(std_dev^2)
print("Proportion of Variance Explained:")
print(prop_var)

# Step 3: Cumulative Proportion of Variance
cum_var <- cumsum(prop_var)
print("Cumulative Proportion of Variance:")
print(cum_var)

# Step 4: Scree Plot
plot(prop_var, type="b", main="Scree Plot", 
     xlab="Principal Component", ylab="Proportion of Variance",
     col="blue", pch=19)

# Step 5: PCA Biplot (First Two Principal Components)
library(ggplot2)
pca_data <- data.frame(iris_pca$x, Species=iris$Species)

ggplot(pca_data, aes(x=PC1, y=PC2, color=Species)) +
  geom_point(size=3) +
  ggtitle("PCA Visualization of Iris Dataset") +
  theme_minimal()
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# HOUSE PRICE PREDICTION 
# Load necessary libraries
library(ggplot2)
library(caret)

# Step 1: Load dataset (Using built-in 'Boston' dataset from MASS)
library(MASS)
data("Boston")
house_data <- Boston  # Assign dataset to a variable

# Step 2: Split dataset into train (80%) and test (20%)
set.seed(123)  # Ensuring reproducibility
train_index <- sample(1:nrow(house_data), 0.8 * nrow(house_data))
train_data <- house_data[train_index, ]
test_data  <- house_data[-train_index, ]

# Step 3: Train Linear Regression Model (Predict 'medv' = Median house price)
model <- lm(medv ~ ., data=train_data)  # Using all predictors

# Step 4: Model Summary (Check R², coefficients, p-values)
summary(model)

# Step 5: Predict on Test Data
predictions <- predict(model, newdata=test_data)

# Step 6: Evaluate Model Performance
mse  <- mean((test_data$medv - predictions)^2)  # Mean Squared Error
rmse <- sqrt(mse)  # Root Mean Squared Error
r2   <- cor(test_data$medv, predictions)^2  # R-Squared

cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
cat("R-Squared:", r2, "\n")

# Step 7: Plot Actual vs Predicted Values
ggplot(data = NULL, aes(x=test_data$medv, y=predictions)) +
  geom_point(color="blue", alpha=0.6) +
  geom_abline(slope=1, intercept=0, color="red", linetype="dashed") +
  ggtitle("Actual vs Predicted House Prices") +
  xlab("Actual Prices") +
  ylab("Predicted Prices") +
  theme_minimal()
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#### HIERARCHICAL CLUSTERING >>>>>>>>>.
# Step 1: Load the dataset
data(iris)

# Step 2: Remove the categorical column (Species) and normalize the numeric data
iris_data <- scale(iris[, -5])  # Standardizing features

# Step 3: Compute the Euclidean distance matrix
dist_matrix <- dist(iris_data, method = "euclidean")

# Step 4: Apply Hierarchical Clustering using Complete Linkage
hc <- hclust(dist_matrix, method = "complete")

# Step 5: Plot the Dendrogram
plot(hc, main = "Hierarchical Clustering Dendrogram", xlab = "", ylab = "Height", sub = "")
rect.hclust(hc, k = 3, border = c("red", "blue", "green"))  # Draws 3 clusters
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#k-MEAN CLUSTERING >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Load necessary library
library(ggplot2)

# Step 1: Load the dataset
data(iris)

# Step 2: Remove the categorical column (Species) and normalize the numeric data
iris_data <- scale(iris[, -5])  # Standardizing features

# Step 3: Apply K-Means clustering (Choose k=3 since there are 3 species)
set.seed(123)  # Ensures reproducibility
kmeans_result <- kmeans(iris_data, centers = 3, nstart = 25)

# Step 4: Add the cluster results to the dataset
iris$Cluster <- as.factor(kmeans_result$cluster)

# Step 5: Visualize the clusters with centroids
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Cluster)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_point(data = as.data.frame(kmeans_result$centers), 
             aes(x = Petal.Length, y = Petal.Width), 
             color = "black", shape = 8, size = 5) +
  labs(title = "K-Means Clustering (Iris Dataset)", x = "Petal Length", y = "Petal Width") +
  theme_minimal()
#_++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## DECision tree 
# Load necessary libraries
library(rpart)
library(rpart.plot)
library(caret)

# Step 1: Load the Iris dataset
data(iris)

# Step 2: Split the dataset (80% Train, 20% Test)
set.seed(123)  # For reproducibility
train_index <- sample(1:nrow(iris), 0.8 * nrow(iris))
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Step 3: Train a Decision Tree model
dt_model <- rpart(Species ~ ., data = train_data, method = "class")

# Step 4: Visualize the Decision Tree
rpart.plot(dt_model, main = "Decision Tree for Iris Dataset", type = 4, extra = 101)

# Step 5: Make predictions
predictions <- predict(dt_model, test_data, type = "class")

# Step 6: Evaluate Model Performance
conf_matrix <- confusionMatrix(predictions, test_data$Species)
print(conf_matrix)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### knn classification 
# Load necessary libraries
library(class)  # For KNN
library(caret)  # For evaluation
library(datasets)

# Step 1: Load the Iris dataset
data(iris)

# Step 2: Normalize numeric features (excluding Species)
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}
iris_norm <- as.data.frame(lapply(iris[, 1:4], normalize))
iris_norm$Species <- iris$Species  # Add back the species column

# Step 3: Split the dataset into Training (80%) and Test (20%)
set.seed(123)  # For reproducibility
train_index <- sample(1:nrow(iris), 0.8 * nrow(iris))
train_data <- iris_norm[train_index, ]
test_data <- iris_norm[-train_index, ]

# Step 4: Implement KNN classifier
k_value <- 5  # Set k
predictions <- knn(train = train_data[, 1:4], 
                   test = test_data[, 1:4], 
                   cl = train_data$Species, 
                   k = k_value)

# Step 5: Evaluate Model Performance
conf_matrix <- confusionMatrix(predictions, test_data$Species)
print(conf_matrix)









