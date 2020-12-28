
library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Word Prediction Application"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("Text",
                        label = ('Type here'),
                        min = 0,
                        max = 50,
                        value = 10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            dataTableOutput('prediction')
        )
    )
))
