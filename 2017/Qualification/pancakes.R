pancake <- function(x, num) {
  x <- strsplit(x, "")[[1]]
  x <- x == "+"
  count <- 0
  for(i in c(1:(length(x) - num + 1))) {
    if(!x[i]) {
      for(j in c(1:num)) {
        x[i + j - 1] <- !x[i + j - 1]
      }
      count = count + 1
    }
  }
  if(all(x)) {
    return(count)
  } else {
    return("IMPOSSIBLE")
  }
}

test <- read.csv("C:/Users/Frank/Desktop/Year 4/4A/Misc/Code Jam/Practice/pancakes_large.in")
test <- sapply(test, as.character)
test <- read.table(text = test, sep = " ", colClasses = c("character", "integer"), strip.white = TRUE)
output <- NULL
for(i in c(1:nrow(test))) {
  outtext <- paste0("Case #", i, ": ", pancake(test[i, 1], test[i, 2]))
  output <- c(output, outtext)
}
write.table(output, "C:/Users/Frank/Desktop/Year 4/4A/Misc/Code Jam/Practice/pancakes_large_result.txt", quote = FALSE, col.names = FALSE, row.names = FALSE)

# pancake("---+-++-", 3)
# pancake("+++++", 4)
# pancake("-+-+-", 4)