# Vector
x.vec <- seq(1,100,by=2)
x.vec

# The function seq is very useful, have a look at the help on seq
# (hint ?seq)
?seq

names(x.vec) <- letters[1:50]

x.vec

#a b c d 
#1 3 5 7 
x.vec
# Matrices

xMat <- cbind(x.vec, rnorm(4), rep(5, 4))
xMat
yMat <- rbind(1:3, rep(1, 3))
yMat
z.mat <- rbind(xMat, yMat)
z.mat


# Data frame
x.df <- as.data.frame(xMat)
names(x.df) <- c("ind", "random", "score")
x.df



#================== sorting and ordering 

# Simplest 
sort
z.vec <- c(5, 3, 8, 2, 3.2)
sort(z.vec)
## [1] 2.0 3.0 3.2 5.0 8.0
order(z.vec)
## [1] 4 2 5 1 3


#===================== chickweight
# ?ChickWeight ...>>>>>> Chicken Weights by Feed Type
?chickwts

ChickWeight[1:2, ]
## weight Time Chick Diet
## 1 42 0 1 1
## 2 51 2 1 1
chick.short <- ChickWeight[1:36, ]
chick.short



## by just weight
chickOrd <- chick.short[order(chick.short$weight),]
chickOrd
## weight Time Chick Diet
## 26 39 2 3 1
## 13 40 0 2 1
## 1 42 0 1 1
## 25 43 0 3 1
## 14 49 2 2 1


## By both time and weight
chick.srt <- chick.short[order(chick.short$Time,chick.short$weight),]
chick.srt


#================================= Missing VAlues ====================

z <- c(1:3, NA)
z
## [1] 1 2 3 NA
ind <- is.na(z)
ind
## [1] FALSE FALSE FALSE TRUE
# To remove missing values from a vector
print(z)
## [1] 1 2 3 NA
x <- z[!is.na(z)]
print(x)
## now missing vlaue is removed 
## [1] 1 2 3




#> Check to see if a vector has all, any or a certain 
#> number of missing values. These create logical vectors
#> which can be used to filter a matrix or data.frame 

# checks whether all values are having na 
all(is.na(z))
## [1] FALSE


# checks wheter any value is NA
any(is.na(z))
## [1] TRUE

# count of NA 
sum(is.na(z))
## [1] 1


sum(is.na(z)) > 1
## [1] FALSE








