df <- data.frame(
  name = c('pillu','pooja','chhakuli'),
  age = c(22,22,22),
  score = c(99.9,97,99)
)

df[df$score > 97]
passed_studnets <- df[df$score > 97,]
print(passed_studnets)
