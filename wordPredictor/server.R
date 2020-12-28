source('model.R')
library(shiny)
library(quanteda)
library(tidyr)
library(dplyr)

# Define server logic
shinyServer(function(input, output) {

    output$prediction <- renderDataTable({
        
        userText <- input$Text %>%
            tokens(remove_punct = T,
                   remove_symbols = T,
                   remove_separators = T,
                   remove_numbers = T,
                   remove_url = T) %>%
            tokens_ngrams(n = 2) %>%
            unlist %>%
            last %>%
            strsplit('_') %>%
            unlist
        word1 <- userText[1]
        word2 <- userText[2]

        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
