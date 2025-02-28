# to display summary of the dataset
iris <- iris

summary(iris)

# Calculate standar deviation
apply(iris,1:4,sd,2)

# To visualize data and plot the histogram
par(mfrow = (2,2))
hist(iris$Sepal.Length, col = 'blue',breaks = 20)
hist(iris$Sepal.Width, col = 'blue',breaks = 20)
hist(iris$Petal.Length, col = 'blue',breaks = 20)
hist(iris$Petal.Width, col = 'blue',breaks = 20)

# Plot scatter plot
ggplot(data = iris , aes(x = Sepal.Length,y=Sepal.Width,col = iris$Species)) +
   geom_point()

       
       







# load dataset
iris <- iris
# convert species factor 
iris$Species <- as.factor(iris$Species)

# check the strucure of the species column 
str(iris$Species)

# Assign numerical values to species 
speciesId <- as.numeric(iris$Species)

pl <- iris$Sepal.Length
pw <- iris$Petal.Width
plot(pl,pw,
     xlab = 'Petal length ',
     ylab = 'petal width ',
     main = 'Petal width vs petal length',
     pch = speciesId,
     col = speciesId
     )

# add legend
legend('bottomright',
       legend = levels(iris$Species),
       pch = 1:3,
       col = 1:3
       )
# load neccessary dataset
iris <- iris
#extract petal length and petal width
pl <- iris$Petal.Length
pw <- iris$Petal.Width

# Plot petal Length Vs petal width
plot(pl,pw,
     xlab='Petal length',
     ylab = 'petal width',
     main = 'Petal width Vs petal length',
     )


# plot sepal width & sepal length
iris <- iris

# plot the given data
plot(iris$Sepal.Width, iris$Sepal.Length)

# plot petalwidth & petallength
pl <- iris$Petal.Length
pw <- iris$Petal.Width
plot(pl,pw)