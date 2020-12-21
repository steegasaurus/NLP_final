library(dplyr)
library(tidytext)
library(tidyr)

tokenize_trigram <- function(txt, coverage = 0.9){
    framed <- tibble(text = txt) %>%
        unnest_tokens(trigram, text, token = 'ngrams', n = 3) %>%
        count(trigram, sort = TRUE) %>%
        subset(n > 2) %>%
        separate(trigram, c('a', 'b', 'c'), sep = ' ') %>%
        mutate(ab = paste(a, b)) %>%
        group_by(ab) %>%
        arrange(ab, desc(n), c) %>%
        select(ab, c, n)
    framed
}
