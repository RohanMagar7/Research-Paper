library(ggplot2)
library(ggfortify)
library(plotly)


data("iris")

iris_numeric <- iris[,1:4]
pca_result <- prcomp(iris_numeric , center = TRUE , scale = TRUE)

View(pca_result)


std_dev <- pca_result$sdev
std_dev

prop_variance <- (std_dev ^ 2 )/sum(std_dev^2)
prop_variance

cum_variance <- cumsum(prop_variance)
cum_variance


print(data.frame(pc = paste0("PC", 1 : length(std_dev)) , std_Dev = std_dev , prop_var = prop_variance , cum_var = cum_variance))

ggplot(data.frame(pc = factor(1:4) , variance = prop_variance) , aes(x = pc, y = variance )) + 
  geom_bar(stat = 'identity' , fill = 'blue') + 
  ggtitle('scale plot') + 
  theme_minimal()




pca_df <- data.frame(pca_result$x , Species = iris$Species)

ggplot(pca_df , aes(x = PC1 , y = PC2 , color = Species)) + 
  geom_point(size = 3 ) + 
  ggtitle("PcA : First two components ") + 
  theme_minimal()


plot_ly(pca_df , x = ~ PC1 , y = ~PC2 , z = ~PC3, color = ~Species , colors = c('red','blue','green')) %>%
  add_markers() %>%
  layout(title = "3D PCA visualization",
         scene = list(xaxis = list(xasix = list(title = 'pc1') , yaxis = list(title = 'pc2'), zaxis = list(title = 'pc3')))
         )






