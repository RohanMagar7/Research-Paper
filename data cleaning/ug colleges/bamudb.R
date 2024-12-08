library(tidyverse)
install.packages('data.table')

library(data.table)
library(tidyverse)
library(dplyr)

library(ggplot2)

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


# R datasets available 
data()


# variable types 
# use glimpse() to check rows and columns other nrow and ncol

glimpse(bamudb)

unique(bamudb$GENDER)

view(group_by(unique(bamudb$GENDER)))

view(unique(bamudb$GENDER))

length(unique(bamudb$GENDER))
bamudb$GENDER1 <- as.factor(bamudb$GENDER)

class(bamudb$GENDER1)

glimpse(bamudb$GENDER1)
view(bamudb$GENDER1)

class(bamudb$PROGRAMME.NAME)


length(unique(bamudb$PROGRAMME.NAME))

bamudb$PROGRAMME.NAME1 <- as.factor(bamudb$PROGRAMME.NAME)


class(bamudb$PROGRAMME.NAME1)


glimpse(bamudb$PROGRAMME.NAME1)

levels(bamudb$PROGRAMME.NAME1)


view(levels(bamudb$PROGRAMME.NAME1))



ggplot(levels(bamudb$PROGRAMME.NAME1, mapping = aes())


       
levels(bamudb$PROGRAMME.NAME1)

names(bamudb)

names(bamudb)


view(bamudb %>% 
       select(PROGRAMME.NAME1 ,starts_with('DOCTOR OF PHILOSOPHY'))
)



























