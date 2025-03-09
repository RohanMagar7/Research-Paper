library(ggplot2)
iris_data <- iris[,-5]

# apply k - means 
set.seed(123)
# perform k - means 
kmeans_result <- kmeans(iris_data , centers = 3 , nstart = 25)

# visualize the cluster

iris$cluster <- as.factor(kmeans_result$cluster)


View(iris)

# scatter plot of clusters 
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width , colour = cluster)) + 
  geom_point(size = 3 ) + 
  labs(
    title = 'K-Means clustering of Iris Dataset',
    x = 'Sepal Length ',
    y = "sepal width"
      ) + 
  theme_minimal()


centers <- as.data.frame(kmeans_result$centers)

# Scatter plot with centroids
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = cluster)) +
  geom_point(size = 3, alpha = 0.6) +  # Plot data points
  geom_point(data = centers, aes(x = Sepal.Length, y = Sepal.Width), 
             color = "black", shape = 8, size = 5) +  # Plot centroids
  labs(title = "K-Means Clustering of Iris Dataset with Centroids",
       x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()


#####++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++










