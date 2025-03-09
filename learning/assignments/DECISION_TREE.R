library(caTools)
library(rpart)
library(rpart)
library(rpart.plot)


dt <- read.csv(path)
dt <- dt[3:5]
dt[,1:2] <- scale(dt[,1:2])

dt$Purchased <- factor(dt$Purchased , levels = c(0,1))

set.seed(123)
split <- sample.split(dt$Purchased , SplitRatio =  0.75)
dt.train <- subset(dt , split == TRUE)
dt.test <- subset(dt,split == FALSE)

dtclassifier <- rpart(formula = Purchased ~ .,data = dt.train)

dtpredict <- predict(dtclassifier , newdata = dt.test[-3])


# Visualize the tree
rpart.plot(dtclassifier, type = 4, extra = 101)


 ####++++++++++++++++++++++++++++++++++++++++++++
library(rpart)

### step 2 ✅ split  tthe  dataa  into  training &  testing sets 


set.seed(123)

# split data ( 80)



