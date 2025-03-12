library(ggplot2)  
library(dendextend)  # For better dendrogram visualization
iris.data <- scale(iris[,-5])
# step 3 compute distance metrics & apply hierachical clustering 
distance_matrix <- dist(iris.data , method = 'euclidean')
h.cluster <- hclust(distance_matrix , method = 'complete')
# step 4 visualize dendrogram 
plot(h.cluster , main = 'Hierachical clustering Dendrogram',sub = '',xlab = '', cex = 0.6)

# step 5 improve the dendrogram visuallization ( convert to dendrogram object for customization)
dend <- as.dendrogram(h.cluster)

# plot enhance dendrogram 
plot(dend, main = 'Colored Dendrogram of Iris Dataset')

# step 6 : cut the tree from center 
clusters <- cutree(h.cluster , k = 3 )
# add cluster labels to dataset
iris$Cluster <- as.factor(clusters)

# View first few rows
head(iris)

# plot the cluster
ggplot(iris, aes(x = Sepal.Length , y = Sepal.Width , color = Cluster)) + 
  geom_point(size = 3 , alpha = 0.7) + 
  labs( title = 'Hierachical clustering : Sepal Length Vs width',
        x = 'Sepal Length',
        y = 'Sepal Width') +
  theme_minimal()
#++++++++++++++++++++++++++++++++++=+++++++++++++++++++++++++++++++++++++++++

set.seed(123)
n_sample <- 20 
x <- matrix(rnorm(n_sample) , ncol = 2)
distance_matrix <- dist(x , method = 'euclidean')
hierachical_iris <- hclust(distance_matrix , method = 'complete')

# plot the dendrogram 
plot(hierachical_iris , main = 'Hierachical clustering Dendrogram',xlab = 'sample Index' , ylab = 'distance')


#cut the dendrogram to get clusters
k <- 3 
clusters <- cutree(hierachical_iris , k)

# Visualize the clusters 
plot(x , col = clusters , pch = 19 , main = 'Hierachical clustering ' , xlab = 'Featur' , ylab = 'feature 2')
