library(dplyr)
library(quanteda)
library(tidyr)

# Load dataframe used for stupid backoff
load('dfModel.rds')

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

