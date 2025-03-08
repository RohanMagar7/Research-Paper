# to load the given dataset

plot(iris)


summary(iris)


# plot histogram of the data
hist(iris$Sepal.Width )

View(iris)
library(ggplot2)

sepalwidth <- table(iris$Sepal.Width)


sepalwidth <- data.frame(sepalwidth)
colnames(sepalwidth) <- c('sepalwidth','frequency')

View(sepalwidth)


ggplot(sepalwidth,aes(x=`sepalwidth`,y=`frequency`))+
  geom_histogram(stat = 'identity', binwidth = 5, bins = 2) +
  labs(title = 'Sepal width Distribution', x = 'Sepal Width' , y = 'Frequency', fill ='Frequency')

  
  
  
  
  
  