vec1 <- c(1,2,3,4,5,6)
vec2 <- c(1,2,3,4,5,8)

a1 <- array(c(vec1,vec2), dim = c(2,3,2))
a1

# created an array that comprises with 
# an array
a1[1,2,1]
a1[2,3,2]


# Factor
# factors used to create categorical values

color <- c('blue','green','yellow')
as.factor(color) -> color1


color1
#---------------------
#data frame 

df <- data.frame(fruit_name = c('apple','banana','gauva'),
           fruit_cost = c(50,10,200)
           )

df

View(df$fruit_cost)

df$fruit_name



