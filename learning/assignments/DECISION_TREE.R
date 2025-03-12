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
iris[-5] <- scale(iris[-5])
head(iris[-5])


# split data ( 80)
train_index <- sample.split(iris$Species , SplitRatio = 0.80)
train_data <- subset(iris,train_index == TRUE)
test_data <- subset(iris,train_index == FALSE)
View(train_data[-5])

### train the classifier of decision tree use the rpart 
df.classifier <- rpart(Species ~ ., data = train_data , method = 'class')
df.prediction <- predict(df.classifier, newdata = test_data[-5] , type = 'class')

df.prediction

rpart.plot(df.classifier , type = 4 , extra = 101)

# evaluate the model 
conf_matrix <- table(predicted = df.prediction , Actual = test_data$Species)
diag_sum <- sum(diag(confmatrix))
sum_all <- sum(confmatrix)
accuracy <- diag_sum / sum_all

print(diag_sum/sum_all)
paste('Accuracy', round(accuracy * 100  , 4) )

#************************************************************************************
'''
Decision Tree
A Decision Tree is a supervised machine learning algorithm used for both classification and regression tasks. 
It works by splitting the dataset into branches based on feature values, forming a tree-like structure that
helps in decision-making.

How It Works:
The dataset is divided into nodes based on the most significant feature (using criteria like Gini index 
or entropy).
The process continues recursively until a stopping condition is met (e.g., max depth or minimum samples per leaf).
The final output is a tree where each path represents a decision rule.

Key Components:
Root Node: The starting point (first decision).
Internal Nodes: Decision points based on feature values.
Leaf Nodes: Final output (class labels or predicted values).

Types of Decision Trees:
Classification Tree: Predicts categories (e.g., spam vs. not spam).
Regression Tree: Predicts continuous values (e.g., house prices).







'''
#************************************************************************************



