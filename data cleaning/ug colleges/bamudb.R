library(tidyverse)
install.packages('data.table')

library(data.table)
library(tidyverse)

bamudb <- fread("F:/Data science/Data analysis/bamudb.csv", na.strings = c("", "NA", "\0"))


library(readr)




bamudb <- read_csv('F:/Data science/Data analysis/bamudb.csv')


bamudb <- read.csv('F:/Data science/Data analysis/bamudb.csv')

phd_all <- read_csv('F:/Data science/Data analysis/filtered/phd_all.csv')

phd_all <- read.csv('F:/Data science/Data analysis/filtered/phd_all.csv')


glimpse(bamudb)

glimpse(phd_all)


glimpse(length(bamudb$GENDER))


print(length(bamudb$GENDER))

nrow(bamudb)
ncol(bamudb)










