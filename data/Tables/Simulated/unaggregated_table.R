# Manually create the data frame
transposed_result <- data.frame(
  BasisType = c("gp", "tp", "cr", "bs"),
  gp = c(-14.71924, -14.83746, -14.69784, -14.68353),
  tp = c(-15.12566, -15.29451, -15.10361, -15.08359),
  cr = c(-15.63047, -15.32432, -15.56607, -15.62294),
  bs = c(-14.61802, NA, -14.59601, -14.57402)
)

# Find the lowest score for each row and subtract each element from it
differences <- t(apply(transposed_result[, 2:5], 1, function(row) row - min(row, na.rm = TRUE)))

# Format the differences to two decimal points
differences <- round(differences, 2)

# Combine the BasisType column with the differences
final_result <- cbind(transposed_result[, 1, drop = FALSE], differences)

# Save the result as an R data object
save(final_result, file = "data/Tables/Simulated/unaggregated_table.RData")

# Print the result
print(final_result)
