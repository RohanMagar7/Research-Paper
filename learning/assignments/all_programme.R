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


