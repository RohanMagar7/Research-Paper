




# Add percentage to programme_summary
programme_summary <- programme_summary %>%
  mutate(Percentage = Count / sum(Count) * 100)

# Pie chart
ggplot(programme_summary, aes(x = "", y = Percentage, fill = `programme Name`)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Proportion of Students Across Programs", fill = "Program Name")
