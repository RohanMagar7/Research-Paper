#Plot the given data
iris <- iris

# Plot the data
plot(iris)

# Summary of the given data
summary(iris)

# Histogram of the data
hist(iris$Sepal.Width)




library(tidyverse)
# load the downloaded dataset
dataset <- read.csv('F:/R programming/learning/assignments/learning dataset/college.csv')


head(dataset)
view(dataset)
class(dataset)
str(dataset)






#load required library
library(e1071)


#Create first matrix
A = matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3)
#Create second matrix
B = matrix(c(7,8,9,10,11,12),nrow = 2, ncol = 3)

sum = A + B
sub = A - B
mul = A * B
div = A / B

print(sum)
print(sub)
print(mul)
print(div)







tens <- array(1:24,dim=c(2,3,4))

print(tens)












matrix_2d <- matrix(1:4, nrow=2)
print(matrix_2d)

vector_1d <- as.vector(matrix_2d)
print(vector_1d)

#3d to 1d
#create a 3D matrix
matrix_3d <- array(1:24,dim =c(3,4,2))
print(matrix_3d)

#convert the matrix 3D to 1D vector 
vector_1d <- as.vector(matrix_3d)
vector_1d



my_vector <- c(c,4,5,3,6,8,10,12)

#length

cat('length of the vector is : ',length(my_vector))


