
library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Word Prediction Application"),

    # Sidebar for text input
    sidebarLayout(
        sidebarPanel(
            textInput("Text",
                        label = ('Type here'),
                        value = ''),
            submitButton('Submit Text')
        ),

        # Show a table of most likely words
        mainPanel(
            verbatimTextOutput('prediction')
        )
    )
))
