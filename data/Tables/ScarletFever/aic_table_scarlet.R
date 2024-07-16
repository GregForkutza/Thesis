# Manually create the data frame correctly
aic_table <- data.frame(
  SmoothType = c("gp", "tp", "cr", "bs"),
  k_9 = c(-12.60388, -12.17104, -13.32448, -12.76761)
)

# Find the lowest score in the column and subtract each element from it
lowest_score <- min(aic_table$k_9, na.rm = TRUE)
differences <- aic_table$k_9 - lowest_score

# Format the differences to two decimal points
differences <- round(differences, 2)

# Combine the SmoothType column with the differences
final_result <- data.frame(SmoothType = aic_table$SmoothType, AIC = differences)

# Save the result as an R data object
save(final_result, file = "data/Tables/ScarletFever/aic_table_scarlet.RData")

# Print the result
print(final_result)
