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


####+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(rpart)
library(rpart.plot)

### step 2 ✅ split  tthe  dataa  into  training &  testing sets 
set.seed(123)

# split data ( 80)
train_index <- sample(1:nrow(iris) , 0.8 * nrow(iris))
train_data <- iris[train_index,]
test_data <- iris[-train_index,]
View(test_data[-5])

## Train Decision Tree Classifier 
dt_classfier <- rpart(Species ~ ., data = train_data ,method = 'class' )

# make prediction on test data 
df_prediction <- predict(dt_classfier, newdata = test_data[-5] , type = 'class')
df_prediction

rpart.plot(dt_classfier , type = 4 , extra = 101)











