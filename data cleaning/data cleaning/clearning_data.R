
data$GENDER <- as.factor(data$GENDER)

class(data$GENDER)

levels(data$GENDER)

data$PROGRAMME.NAME <- as.factor(data$PROGRAMME.NAME)


levels(data$PROGRAMME.NAME)

genderTable <- table(data$GENDER)

view(genderTable)

genderTable

colnames(genderTable) <- c('gende','counts')














