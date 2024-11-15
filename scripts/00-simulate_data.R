#### Preamble ####
# Purpose: Simulates a dataset of Apple between two Vendors
# Author: Doran Wang
# Date: 14 Nov. 2024
# Contact: doran.wang@mail.utoronto.ca
# License: None
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `difference_sale` rproj

#### Workspace setup ####
library(tidyverse)
set.seed(304)

#### Simulate data ####
# Vendors
vendor <- c("NoFrills", "Loblaws")

# Prices
prices <- c(1.21, 1.54)

# Create a dataset by randomly assigning vendors and prices, with conditions for Loblaws and NoFrills
analysis_data <- tibble(
  product = paste("Product", 1:50),  # Add "Product" to make it a character
  vendor = sample(
    vendor,
    size = 50,
    replace = TRUE,
    prob = c(0.5, 0.5) # Rough vendor distribution
  ),
  current_price = sample(
    prices,
    size = 50,
    replace = TRUE
  ),
  old_price = if_else(
    vendor == "Loblaws" & current_price == 1.21, 
    1.54,  # Assign 1.54 if current price is 1.21
    NA_real_  # Otherwise, set old_price to NA
  )
)

# For NoFrills, we don't need old_price, so we will set it as NA
analysis_data <- analysis_data %>%
  mutate(
    old_price = if_else(vendor == "NoFrills", NA_real_, old_price)
  )

#### Save data ####
write_csv(analysis_data, "data/simulated_data.csv")
