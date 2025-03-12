setwd("F:/R programming/learning/ai_project")
# Load libraries
library(mlbench)
library(caret)
library(randomForest)
library(caTools)

# Load dataset
data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes

# Split into training & testing sets
set.seed(123)
trainIndex <- sample.split(df$diabetes, SplitRatio = 0.90)

train <- subset(df, trainIndex)
test <- subset(df, !trainIndex)

head(train)
summary(train)

# Train Random Forest model
model <- randomForest(diabetes ~ ., data = train, ntree = 100)


# Save model for deployment
saveRDS(model, "diabetes_model.rds")

