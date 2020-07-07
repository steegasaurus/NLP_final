# Function that takes a numeric vector argument and returns the minimum number
# of elements required to reach a percentage 0 < x < 1 as the second argument.

findPortion <- function(v, x){
    if(x < 0 | x > 1){
        stop('Invalid x. Please choose a number between 0 and 1')
    }
    p <- NULL
    r <- NULL
    v <- sort(v, decreasing = TRUE)
    for(i in 1:length(v)){
        r <- c(r, v[i])
        p <- sum(r)/sum(v)
        if(p > x){
            return(r)
        }
    }
}