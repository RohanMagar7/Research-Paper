mode_value = names(which.max(table(data)))
###@@@@
e1071

# Define colors for species
species_colors <- c("setosa" = "red", "versicolor" = "blue", "virginica" = "green")

# Add legend
legend("topright", legend=names(species_colors), 
       col=species_colors, pch=19, title="Species")
