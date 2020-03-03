#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("The sinking of the Titanic: predicting survival"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            h3("Select variable values:"),
            selectInput("Sel01_Sex", "Sex:", c("Male" = "male", "Female" = "female")),
            selectInput("Sel02_Embark", "Port of Embarkation:", 
                        c("Cherbourg" = "C","Queenstown" = "Q","Southampton" = "S")),
            selectInput("Sel03_Class", "Class:", c("1st" = 1, "2nd" = 2, "3rd" = 3)),
            numericInput("numIn01_Age", "Age:", value = 20, min = 0, max = 120),
            
            submitButton("Submit")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h3("Survive probability:"),
            h3(textOutput("pred1")),
            plotOutput("plot1"),
            h4("Using random forest por predict surivival in the sinking of the Titanic, we use the titanic dataset."),
            h5("Titanic dataset:",a("https://www.kaggle.com/c/titanic", href="https://www.kaggle.com/c/titanic"))
    )
    )
))
