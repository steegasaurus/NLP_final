library(dplyr)
library(readr)
library(quanteda)
library(tidyr)
library(tidytext)

blogs <- read_lines('final/en_US/en_US.blogs.txt')
news <- read_lines('final/en_US/en_US.news.txt')
tweets <- readLines('final/en_US/en_US.twitter.txt')


