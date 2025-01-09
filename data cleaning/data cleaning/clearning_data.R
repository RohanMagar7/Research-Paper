
data$GENDER <- as.factor(data$GENDER)

class(data$GENDER)

levels(data$GENDER)

data$PROGRAMME.NAME <- as.factor(data$PROGRAMME.NAME)


levels(data$PROGRAMME.NAME)

genderTable <- table(data$GENDER)

view(genderTable)

genderTable

colnames(genderTable) <- c('gende','counts')


# select variables 
names(data)




glimpse(starwars)

class(starwars$gender)

unique(starwars$gender)


levels(starwars$gender)


starwars$gender <- factor((starwars$gender),
                          levels = c('masculine', 'feminine'))




levels(starwars$gender)



#### selecting variables

names(starwars)


starwars %>%
  select(name, height, ends_with('color')) %>% # selecting variabes that ends with color
  names()



starwars %>%
  select(name,height,ends_with('color')) %>%
  filter(hair_color %in% c('blond' , 'brown') &
           height < 180 )



phdcs_chemi <- data %>%
  select( PROGRAMME.NAME, NAME.OF.THE.APPLICANT, CATEGORY , starts_with('DOCTOR OF PHILOSOPHY')) %>%
  filter(PROGRAMME.NAME %in% c('DOCTOR OF PHILOSOPHY(COMPUTER SCIENCE)'))




view(phdcs_chemi)



table(phdcs_chemi$CATEGORY)


view(table(phdcs_chemi$CATEGORY))


barplot(table(phdcs_chemi$CATEGORY))

























