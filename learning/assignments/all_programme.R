
get_center <- function(dat){
  mean_value = mean(dat)
  median_value = median(dat)
  mode_value = names(which.max(table(data)))
  
  cat("Mean:", mean_value, "\n")
  cat("Median:", median_value, "\n")
  cat("Mode:", mode_value, "\n")
  
}
data <- c(10, 20, 20, 30, 40, 50, 50, 50, 60, 70, 80)
get_center(data)




###@@@@
e1071




