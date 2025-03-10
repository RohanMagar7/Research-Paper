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



