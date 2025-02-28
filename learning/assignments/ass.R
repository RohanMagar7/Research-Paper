library(MASS)
library(ggplot2)

# Use the Boston housing dataset
data <- Boston  

# Rename the target variable (house price)
colnames(data)[14] <- "Price"

set.seed(123)  
train_indices <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Train a linear regression model (Predicting house prices)
model <- lm(Price ~ ., data = train_data)

# Model summary
summary(model)

# Predict on test data
predictions <- predict(model, newdata = test_data)

# Evaluate model performance (Mean Squared Error)
mse <- mean((test_data$Price - predictions)^2)
cat("Mean Squared Error:", mse, "\n")

ggplot(data.frame(Actual = test_data$Price, Predicted = predictions), aes(x = Actual, y = Predicted)) +
  geom_point(color = "blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Actual vs Predicted House Prices", x = "Actual Price", y = "Predicted Price") +
  theme_minimal()






































library(ggplot2)
library(ggfortify)
library(plotly)

data(iris)
iris_numeric <- iris[, 1:4]

pca_result <- prcomp(iris_numeric, center = TRUE, scale. = TRUE)

std_dev <- pca_result$sdev
prop_variance <- (std_dev^2) / sum(std_dev^2)
cum_variance <- cumsum(prop_variance)

print(data.frame(PC = paste0("PC", 1:length(std_dev)), Std_Dev = std_dev, Prop_Var = prop_variance, Cum_Var = cum_variance))

ggplot(data.frame(PC = factor(1:4), Variance = prop_variance), aes(x = PC, y = Variance)) +
  geom_bar(stat = "identity", fill = "blue") + ggtitle("Scree Plot") + theme_minimal()

pca_df <- data.frame(pca_result$x, Species = iris$Species)
ggplot(pca_df, aes(x = PC1, y = PC2, color = Species)) + geom_point(size = 3) + ggtitle("PCA: First Two Components") + theme_minimal()

plot_ly(pca_df, x = ~PC1, y = ~PC2, z = ~PC3, color = ~Species, colors = c("red", "blue", "green")) %>%
  add_markers() %>%
  layout(title = "3D PCA Visualization", scene = list(xaxis = list(title = "PC1"), yaxis = list(title = "PC2"), zaxis = list(title = "PC3")))
