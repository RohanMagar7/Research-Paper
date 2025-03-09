library(ggplot2)  # For visualization
library(dendextend)  # For better dendrogram visualization

iris.data <- scale(iris[,-5])

### step 3 computer distance metrics  & apply hierachical clustering 

distance_matrix <- dist(iris.data , method = 'euclidean')
hc <- hclust(distance_matrix , method = 'complete')

# step 4 : visualize dendrogramm 
# Basic dendrogram
plot(hc,main='Hierachical clustering Dendrogram' , sub = '' , xlab = '' , cex = 0.6)


# step 5 imrove the dendrogramm visualization
# convert to dendrogram object for customization
dend <- as.dendrogram(hc)

# plot enhance dendrogram 
plot(dend, main = 'Colored Dendrogram of Iris Dataset')



### optional 

# Step 6 : cut the tree from from center 🌴 
clusters <- cutree(hc, k = 3)

# Add cluster labels to dataset
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







