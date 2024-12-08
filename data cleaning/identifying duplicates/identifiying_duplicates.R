library(janitor)



# Generate a dataframe with 20 rows
set.seed(123) # For reproducibility



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




