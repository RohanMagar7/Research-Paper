library(ggplot2)
library(caret)
library(MASS)
library(caTools)
library(class)


# step 2 : load "Boston" dataset
data('Boston')
df <- Boston

# step 3 : train_test split 80 - 20 
set.seed(123)
trainList <- sample.split(df$medv , SplitRatio = 0.80)
train_data <- subset(df, trainList == TRUE)
test_data <- subset(df,trainList == FALSE)

# Step 4 : Train the linear regression model 
model <- lm(medv ~ . , data = train_data)


# Step 5 : Model Summary 
summary(model)


# step 6 : Predict on Test Data
predictions <- predict(model , newdata = test_data)


# step 7 : Evaluate Model Performance 
# Calculate RMSE ( root mean squared error )

rmse <- sqrt(mean(predictions - test_data$medv) ^ 2 )
print(paste('RMSE', round(rmse , 2)))


# calculate R - squared 
r_squared <- cor(predictions , test_data$medv) ^2


print(paste('R-Squared' , round(r_squared, 2)))


# step 8 : Plot actual Vs Predicted values 
ggplot(data = data.frame(Actual = test_data$medv , predicted = predictions ) , aes(x = Actual , y = predicted)) + 
  geom_point(color = 'blue' , alpha = 0.6)+ 
  geom_abline(slope = 1 , intercept = 0 , color = 'red' , linetype = 'dashed' ) + 
  labs(title = 'Actual Vs Predicted House Prices ', 
       x = 'actual prices ',
       y = 'predicted prices'
       )+ 
  theme_minimal()







