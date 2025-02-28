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
