#### Preamble ####
# Purpose: Tests the structure and validity of the simulated apple price dataset.
# Author: Doran Wang
# Date: 14 Nov. 2024
# Contact: doran.wang@mail.utoronto.ca
# License: None
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - simulate_data.R must have been run
# Any other information needed? Make sure you are in the `differece_sale` rproj


#### Workspace setup ####
library(tidyverse)

data <- read_csv("data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 50 rows
if (nrow(data) == 50) {
  message("Test Passed: The dataset has 50 rows.")
} else {
  stop("Test Failed: The dataset does not have 50 rows.")
}

# Check if the dataset has 4 columns
if (ncol(data) == 4) {
  message("Test Passed: The dataset has 4 columns.")
} else {
  stop("Test Failed: The dataset does not have  columns.")
}

# Check if all values in the 'product' column are unique
if (n_distinct(data$product) == nrow(data)) {
  message("Test Passed: All values in 'product' are unique.")
} else {
  stop("Test Failed: The 'product' column contains duplicate values.")
}

# Check if the 'vendor' column contains only valid vendor name
valid_vendor <- c("NoFrills","Loblaws")

if (all(data$vendor %in% valid_vendor)) {
  message("Test Passed: The 'vendor' column contains only valid vendor names.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid vendor names.")
}

# Check if the 'current_price' column contains only valid price
valid_prices <- c(1.21,1.54,NA)

if (all(data$current_price %in% valid_prices)) {
  message("Test Passed: The 'current_price' column contains only valid prices.")
} else {
  stop("Test Failed: The 'current_price' column contains invalid prices.")
}

# Check if the 'old_price' column contains only valid price
valid_prices <- c(1.54,NA)

if (all(data$old_price %in% valid_prices)) {
  message("Test Passed: The 'old_price' column contains only valid prices.")
} else {
  stop("Test Failed: The 'old_price' column contains invalid prices.")
}
