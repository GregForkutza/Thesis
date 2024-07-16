# Manually create the data frame correctly and ensure the k_7 column is numeric
aic_table <- data.frame(
  SmoothType = c("gp", "tp", "cr", "bs"),
  k_7 = c(-8.62613, -9.727719, -9.865612, NA)
)

# Convert the k_7 column to numeric if it is not already
aic_table$k_7 <- as.numeric(as.character(aic_table$k_7))

# Find the lowest score in the column and subtract each element from it
lowest_score <- min(aic_table$k_7, na.rm = TRUE)
differences <- aic_table$k_7 - lowest_score

# Format the differences to two decimal points
differences <- round(differences, 2)

# Combine the SmoothType column with the differences
final_result <- data.frame(SmoothType = aic_table$SmoothType, Difference = differences)

# Save the result as an R data object
save(final_result, file = "data/Tables/Ireland/aic_table_Ireland.RData")

# Print the result
print(final_result)
