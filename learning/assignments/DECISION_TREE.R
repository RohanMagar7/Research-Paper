# for decision tree plot or use the rpart 
library(rpart)
library(rpart.plot)
library(caTools)

# step 1 : import dataset 
dt <- read.csv(path)
# step 2 : selection numeric data
dt <- dt[3:5]

## step 3 scale the data ( only dependent variables)
dt[,1:2] <- scale(dt[,1:2])

# step 4 
### convert independent variable into factors
dt$Purchased <- factor(dt$Purchased , level = c(0,1))


### step 5 split data into training and tesing 

set.seed(123)
splitList <- sample.split(dt$Purchased, SplitRatio = 0.75)
dt.train <- subset(dt , splitList == TRUE)
dt.test <- subset(dt,splitList == FALSE)


# step 6 classifiy the data using rpart classifier 
dt.classifier <- rpart(formula = Purchased ~ . , data = dt.train)
dt.predict <- predict(dt.classifier , newdata = dt.test[-3])


# Visualize the tree
rpart.plot(dt.classifier, type = 4, extra = 101)


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

# evaluate the model 
conf_matrix <- table(predicted = df_prediction , Actual = test_data$Species)
diag_sum <- sum(diag(confmatrix))
sum_all <- sum(confmatrix)
accuracy <- diag_sum / sum_all

print(diag_sum/sum_all)
paste('Accuracy', round(accuracy * 100  , 4) )




