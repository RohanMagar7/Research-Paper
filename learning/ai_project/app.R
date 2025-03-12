setwd("F:/R programming/learning/ai_project")
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
      numericInput("pregnant", "Pregnancies:", value = 2, min = 0, max = 20),
      numericInput('triceps','Triceps',value = 20 , min = 0 , max = 99),
      numericInput('insulin' ,'Insulin', value = 77 , min = 0 , max = 846),
      numericInput('mass','Mass',value = 31 , min = 0 , max = 68),
      numericInput('pedigree','Pedigree',value = 0.5, min = 0 , max = 3),
      numericInput('age','Age',value=29,min = 21,max = 81),
      numericInput('pressure','Pressure',value = 69 , min = 0 , max = 122),
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
    new_data <- data.frame(glucose = input$glucose, bmi = input$bmi , pregnant = input$pregnant,
                           triceps = input$triceps ,insulin = input$insulin , mass = input$mass,
                           pedigree = input$pedigree , age = input$age, pressure = input$pressure
                           )
    predict(model, new_data)
  })
  
  output$result <- renderText({
    req(predict_diabetes())
    paste("Prediction:", predict_diabetes())
  })
}

# Run App
shinyApp(ui, server)
