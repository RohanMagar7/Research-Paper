







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