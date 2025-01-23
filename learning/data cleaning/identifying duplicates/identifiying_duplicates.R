install.packages('tidyverse')
library(janitor)



# Generate a dataframe with 20 rows
set.seed(123) # For reproducibility

library(readxl)


library(tidyverse)


glimpse(starwars)


# creating df of csv dataset of bamu

bamu <- read.csv('F:/Data science/Data analysis/all_excel20241009144203.csv')

bamu <- read_excel('F:/Data science/Data analysis/all_excel/all_excel20241009144203.xlsx')

bamu <- all_excel20241009144203


phd <- read.csv('F:/Data science/Data analysis/filtered/phd_all.csv')


glimpse(phd)


view(glimpse(bamu))




data <- data.frame(
  IPAddress = paste0("192.168.1.", 1:20),
  q1 = sample(1:5, 20, replace = TRUE),
  q2 = sample(1:5, 20, replace = TRUE),
  q3 = sample(1:5, 20, replace = TRUE),
  q4 = sample(1:5, 20, replace = TRUE)
)

# View the dataframe
print(data)


View(data)



get_dupes(data)


get_dupes(data,IPAddress)









