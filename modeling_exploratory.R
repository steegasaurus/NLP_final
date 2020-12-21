library(dplyr)
library(readr)
library(quanteda)
library(tidyr)
library(tidytext)

blogs <- read_lines('final/en_US/en_US.blogs.txt')
news <- read_lines('final/en_US/en_US.news.txt')
tweets <- readLines('final/en_US/en_US.twitter.txt')

#I need to turn each sentence into a separate 'document'
#I need to combine all 3 datasets
#I need to tokenize the whole thing and remove unnecessary characters
