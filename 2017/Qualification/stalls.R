require("gmp")

# stalls <- function(n, k) {
#   if(k == 1) {
#     return(c(n %/% 2, n %/% 2 + n %% 2 - 1))
#   } else if(k %% 2 == 0) {
#     return(stalls(n %/% 2, k/2))
#   } else {
#     return(stalls(n %/% 2 + n %% 2 - 1, (k-1)/2))
#   }
# }

stalls_big <- function(n, k) {
  if(k == 1) {
    return(c(divq.bigz(n, 2), divq.bigz(n, 2) + mod.bigz(n, 2) - 1))
  } else if(mod.bigz(k, 2) == 0) {
    return(stalls_big(divq.bigz(n, 2), div.bigz(k, 2)))
  } else {
    return(stalls_big(divq.bigz(n, 2) + mod.bigz(n, 2) - 1, divq.bigz(k, 2)))
  }
}


test <- read.csv("C:/Users/Frank/Desktop/Year 4/4A/Misc/Code Jam/Practice/2017 Qualifying/stalls_large.in", colClasses = "character")
test <- sapply(test, as.character)
test <- read.table(text = test, sep = " ", colClasses = c("character", "character"), strip.white = TRUE)
output <- NULL
for(i in c(1:nrow(test))) {
  temp <- stalls_big(as.bigz(test[i, 1]), as.bigz(test[i, 2]))
  outtext <- paste0("Case #", i, ": ", as.character(temp[1]), " ", as.character(temp[2]))
  output <- c(output, outtext)
}
