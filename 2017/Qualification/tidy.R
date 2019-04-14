tidynum <- function(x) {
  x <- strsplit(toString(x), "")[[1]]
  x <- unname(sapply(x, as.numeric))
  if(length(x) > 1) {
    for(i in c((length(x) - 1):1)) {
      if(x[i] > x[i + 1]) {
        x[i] <- x[i] - 1
        for(j in c((i + 1):length(x))) {
          x[j] <- 9
        }
      }
    }
    x <- x[x != 0]
  }
  return(paste0(x, collapse = ""))
}


test <- read.csv("C:/Users/Frank/Desktop/Year 4/4A/Misc/Code Jam/Practice/tidy_large.in", colClasses = "character")
test <- sapply(test, as.character)
output <- NULL
for(i in c(1:nrow(test))) {
  outtext <- paste0("Case #", i, ": ", tidynum(test[i, 1]))
  output <- c(output, outtext)
}
write.table(output, "C:/Users/Frank/Desktop/Year 4/4A/Misc/Code Jam/Practice/tidy_large_result.txt", quote = FALSE, col.names = FALSE, row.names = FALSE)

# tidynum("132")
# tidynum("1000")
# tidynum("7")
# tidynum("111111111111111110")
