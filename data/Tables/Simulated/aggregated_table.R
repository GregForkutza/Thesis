# Manually create the data frame
transposed_result <- data.frame(
  BasisType = c("gp", "tp", "cr", "bs"),
  gp = c(-10.32463, -11.00934, -10.37174, -10.31435),
  tp = c(-10.236070, -11.216410, -10.172020, -9.938077),
  cr = c(-12.25672, -11.90624, -12.15129, -12.21444),
  bs = c(-11.24893, NA, -11.22282, -11.11817)
)

# Find the lowest score for each row and subtract each element from it
differences <- t(apply(transposed_result[, 2:5], 1, function(row) row - min(row, na.rm = TRUE)))

# Format the differences to two decimal points
differences <- round(differences, 2)

# Combine the BasisType column with the differences
final_result <- cbind(transposed_result[, 1, drop = FALSE], differences)

# Save the result as an R data object
save(final_result, file = "data/Tables/Simulated/aggregated_table.RData")

# Print the result
print(final_result)
