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

hist(iris$Sepal.Width)

ggplot(sepalwidth,aes(x=`sepalwidth`,y=`frequency`))+
  geom_histogram(stat = 'identity', binwidth = 5, bins = 2) +
  labs(title = 'Sepal width Distribution', x = 'Sepal Width' , y = 'Frequency', fill ='Frequency')

  
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.2, color = 'black') +
  labs(title = 'Sepal Width Distribution', x = 'Sepal Width', y = 'Frequency')

  

ggplot(sepalwidth, aes(x = sepalwidth, y = frequency)) +
  geom_bar(stat = 'identity', fill = 'green', width = 1) +
  labs(title = 'Sepal Width Distribution', x = 'Sepal Width', y = 'Frequency')

  
  
pl <- iris$Petal.Length
pw <- iris$Petal.Width

plot(pl)
plot(pw)
plot(pl,pw)

plot(pw,pl)




  