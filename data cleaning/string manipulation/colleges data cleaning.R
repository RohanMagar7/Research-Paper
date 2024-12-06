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
      stringr::str_replace_all("[^a-z0-9 ]", "") %>% # Remove special characters
      stringr::str_squish() # Remove extra whitespace
  )

# Step 2: Generate a distance matrix for clustering
distance_matrix <- stringdistmatrix(data$College_Cleaned, data$College_Cleaned, method = "jw")

# Step 3: Perform clustering
hclust_res <- hclust(as.dist(distance_matrix), method = "average")

# Step 4: Cut the dendrogram into clusters
# Adjust `k` based on the variety of colleges in your data
num_clusters <- 200 # You can change this based on inspection
cluster_assignments <- cutree(hclust_res, k = num_clusters)

# Step 5: Assign consistent names to each cluster
# Use the first name in each cluster as the representative
data <- data %>%
  mutate(Cluster = cluster_assignments) %>%
  group_by(Cluster) %>%
  mutate(Consistent_College_Name = first(UG.INSTITUTE.COLLEGE)) %>%
  ungroup()

# Step 6: Save the cleaned dataset
write.csv(data, "cleaned_college_data.csv", row.names = FALSE)

# Optional: Preview the first few rows of cleaned data
print(data %>% select(UG.INSTITUTE.COLLEGE, Consistent_College_Name) %>% head(20))
