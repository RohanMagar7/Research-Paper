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


