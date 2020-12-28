source('model.R')
library(shiny)
library(quanteda)
library(tidyr)
library(dplyr)

# Define server logic
shinyServer(function(input, output) {
    
    output$prediction <- renderPrint({
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
            unlist %>%
            tolower
        word1 <- userText[1]
        word2 <- userText[2]
        if(length(unlist(strsplit(input$Text, split = ' '))) < 2){
            word2 <- tolower(input$Text)
        }
        pred <- findWord(word1, word2)
        print(pred)
    })

})
