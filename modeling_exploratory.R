library(dplyr)
library(readr)
library(quanteda)
library(tidyr)

blogs <- read_lines('final/en_US/en_US.blogs.txt')
news <- read_lines('final/en_US/en_US.news.txt')
tweets <- readLines('final/en_US/en_US.twitter.txt')
combinedRaw <- c(blogs, news, tweets)
set.seed(42)
n <- 10
combined <- sample(combinedRaw, size = length(combinedRaw)/n)
trigrams <- tokens(combined, 
                remove_punct = T, 
                remove_symbols = T, 
                remove_numbers = T,
                remove_separators = T,
                remove_url = T) %>%
    tokens_tolower %>%
    tokens_ngrams(n = 3) %>%
    unlist

dfModel <- tibble(text = trigrams) %>%
    separate(text, c('a', 'b', 'c'), sep = '_')

save(dfModel, file = 'dfModel.rds')

findWord <- function(word1, word2){
    if(word1 %in% dfModel$a & word2 %in% dfModel$b){
        pred <- dfModel %>%
            subset(a %in% word1 & b %in% word2) %>%
            select(c) %>%
            table %>% 
            sort(decreasing = T) %>%
            names %>%
            head
    }else if(word2 %in% dfModel$b){
        pred <- dfModel %>%
            subset(b %in% word2) %>%
            select(c) %>%
            table %>%
            sort(decreasing = T) %>%
            names %>%
            head
    }else{
        pred <- dfModel %>%
            select(c) %>%
            table %>%
            sort(decreasing = T) %>%
            names %>%
            head
    }
    pred
}

