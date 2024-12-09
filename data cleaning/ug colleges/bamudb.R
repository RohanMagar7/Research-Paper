#install.packages('data.table')

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)

library(readr)

bamudb <- fread("F:/Data science/Data analysis/bamudb.csv", na.strings = c("", "NA", "\0"))






bamudb <- read_csv('F:/Data science/Data analysis/bamudb.csv')


problems(bamudb) 


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

       
ggplot(bamudb,aes(x = unique(GENDER1), y = GENDER1)) + 
  geom_bar(fill = 'purple') + 
  labs(title = 'box plto of score ', x = '', y = 'Score')       
       

       
levels(bamudb$PROGRAMME.NAME1)

names(bamudb)

names(bamudb)


view(bamudb %>% 
       select(PROGRAMME.NAME1 ,starts_with('DOCTOR OF PHILOSOPHY'))
)



# Example data
PROGRAMME.NAMES <- data.frame(category = bamudb$PROGRAMME.NAME1)

# Count occurrences

view(PROGRAMME.NAMES)


programcountes <- table(PROGRAMME.NAMES$category)
print(programcountes)
view(programcountes)

programcountes <- data.frame(programcountes)


view(programcountes$)

ggplot(programcountes,aes(x=Var1 , y=Freq ))+
  geom_bar(fill = 'purple') + 
  labs(title = 'programes ', x = 'Names of the Programes', y = 'enrolled') 



























