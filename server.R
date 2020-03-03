#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(rpart)
library(rpart.plot)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    set.seed(1234)
    df_titanic_training <- read.csv("titanic_train.csv")
    df_titanic_training <- df_titanic_training[,-c(1)]
    mod_rf <- rpart(Survived ~ ., data = df_titanic_training, method = "class")
    
    model1Pred <- reactive({
        pclassInput <- as.numeric(input$Sel03_Class)
        SexInput <- input$Sel01_Sex
        AgeInput <- input$numIn01_Age
        EmbarkInput <- input$Sel02_Embark
        
        newdata <- data.frame(Pclass = pclassInput, Sex = SexInput, Age = AgeInput, Embarked = EmbarkInput)
        
        pred <- predict(mod_rf, newdata = newdata)
        paste0(format(as.numeric(pred[1,2])*100, digits = 2), "%")
    })
    
    
    output$plot1 <- renderPlot({
        
        rpart.plot(mod_rf)
        
    })
    
    output$pred1 <- renderText({
        model1Pred()
    })

    
})
