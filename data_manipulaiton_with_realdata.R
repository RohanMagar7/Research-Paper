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
View(bamu)



column_startswith <- bamu %>% select(starts_with("p"))

View(column_startswith)

ncol(column_startswith)


column_name_endswith <- bamu %>% select(ends_with("s"))


ncol(column_name_endswith)
View(column_name_endswith)

phd_cs <- bamu %>% filter(bamu$`PROGRAMME NAME` == 'DOCTOR OF PHILOSOPHY(COMPUTER SCIENCE)')

View(phd_cs)

phd_all <- bamu %>% filter(grepl('DOCTOR OF PHILOSOPHY', bamu$`PROGRAMME NAME`))


View(phd_all)

# Export a data frame to a text file using write.csv()
df = data.frame(phd_cs) 


nrow(phd_all)
nrow(phd_cs)
ncol(phd_cs)
ncol(phd_all)

write.csv(df, file = "F:/Data science/Data analysis/filtered/phd_cs.csv")
write.csv(phd_all, file = "F:/Data science/Data analysis/filtered/phd_all.csv")

library(ggplot2)






















