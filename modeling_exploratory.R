library(dplyr)
library(readr)
library(quanteda)
library(tidyr)
library(tidytext)

blogs <- read_lines('final/en_US/en_US.blogs.txt')
news <- read_lines('final/en_US/en_US.news.txt')
tweets <- readLines('final/en_US/en_US.twitter.txt')
combined <- c(corpus(blogs), corpus(news), corpus(tweets))
sentences <- unlist(tokens(combined, what = 'sentence'))
words <- tokens(sentences, 
                remove_punct = T, 
                remove_symbols = T, 
                remove_numbers = T)

