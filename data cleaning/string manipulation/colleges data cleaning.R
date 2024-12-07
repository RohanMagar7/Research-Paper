install.packages('janitor')
install.packages('stringr')
install.packages('lubridate')
install.packages('tibble')

library(dplyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(stringr)
library(tibble)

bamu <- read.csv('F:/Data science/Data analysis/filtered/phd_all.csv')


df <- tibble(bamu)

df
view(bamu)

view(df)


View(bamu)


summary(bamu)


unmarried <- is.na(bamu$MARITAL.STATUS)

bamu$MARITAL.STATUS[is.na(bamu$MARITAL.STATUS)]  <- ("unmarried")

view(bamu$MARITAL.STATUS)
duplicated(bamu$MARITAL.STATUS)
str_to_upper(bamu$MARITAL.STATUS)


head(bamu)
tail(bamu)
summary(bamu)
grouping(bamu$MARITAL.STATUS)


view(bamu$UG.INSTITUTE.COLLEGE)


bamu$MARITAL.STATUS <-  str_replace(NA,'MARRIED')



datetime <- ymd(bamu$PAYMENT.DATE)

view(datetime)


install.packages('stringdist')



# Load required libraries
library(dplyr)
library(stringdist)

# Assuming your dataset is already loaded and named `data`
# Column name for colleges is `UG.INSTITUTE.COLLEGE`

# Step 1: Preprocess college names
data <- bamu %>%
  mutate(
    College_Cleaned = UG.INSTITUTE.COLLEGE %>%
      tolower() %>% # Convert to lowercase
      stringr::str_replace_all("[^a-z0-9 ]", "") %>% 
      stringr::str_squish() 
  )


distance_matrix <- stringdistmatrix(data$College_Cleaned, data$College_Cleaned, method = "jw")

view(distance_matrix)


hclust_res <- hclust(as.dist(distance_matrix), method = "average")


num_clusters <- 200
cluster_assignments <- cutree(hclust_res, k = num_clusters)


data <- data %>%
  mutate(Cluster = cluster_assignments) %>%
  group_by(Cluster) %>%
  mutate(Consistent_College_Name = first(UG.INSTITUTE.COLLEGE)) %>%
  ungroup()


write.csv(data, "cleaned_college_data.csv", row.names = FALSE)


print(data %>% select(UG.INSTITUTE.COLLEGE, Consistent_College_Name) %>% head(20))
