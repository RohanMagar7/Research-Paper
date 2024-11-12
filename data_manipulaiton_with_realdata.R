bamu
programme_name <- bamu$`PROGRAMME NAME`
programme_name
programme_name <- NULL
programme_name
library(dplyr)
nrow(bamu)
ncol(bamu)
print((nrow(bamu)) * (ncol(bamu)))


nums <- c(1:100)
nums

# let's consider there are 10000 cols ( we have 815)
# 

# in using pipe operator and selecto function which iw part of dplyr package
# we are selectin first 100 columns


bamu %>% select(1:100) -> bamu2

View(bamu2)



column_startswith <- bamu %>% select(starts_with("p"))

View(column_startswith)

ncol(column_startswith)


column_name_endswith <- bamu %>% select(ends_with("s"))


ncol(column_name_endswith)
View(column_name_endswith)



















