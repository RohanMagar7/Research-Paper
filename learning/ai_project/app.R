library(shiny)
library(randomForest)

# Load trained model
model <- readRDS("diabetes_model.rds")

# Define UI
ui <- fluidPage(
  titlePanel("Diabetes Prediction"),
  sidebarLayout(
    sidebarPanel(
      numericInput("glucose", "Glucose Level:", value = 100, min = 50, max = 200),
      numericInput("bmi", "BMI:", value = 25, min = 10, max = 50),
      actionButton("predict", "Predict")
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Define Server Logic
server <- function(input, output) {
  predict_diabetes <- eventReactive(input$predict, {
    new_data <- data.frame(glucose = input$glucose, bmi = input$bmi)
    predict(model, new_data)
  })
  
  output$result <- renderText({
    req(predict_diabetes())
    paste("Prediction:", predict_diabetes())
  })
}

# Run App
shinyApp(ui, server)