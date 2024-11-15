#### Preamble ####
# Purpose: Tests the structure and validity of the clean dataset.
# Author: Doran Wang
# Date: 14 Nov. 2024
# Contact: doran.wang@mail.utoronto.ca
# License: None
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - The `testthat` package must be installed and loaded
# - Have the clean_data.csv
# Any other information needed? Make sure you are in the `differece_sale` rproj

#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("../data/clean_data.csv")


#### Test data ####
# Test that the dataset has 65 rows - there are 65 product_names in Australia
test_that("dataset has 65 rows", {
  expect_equal(nrow(data), 65)
})

# Test that the dataset has 7 columns
test_that("dataset has 7 columns", {
  expect_equal(ncol(data), 7)
})

# Test that the 'product_name' column is character type
test_that("'product_name' is character", {
  expect_type(data$product_name, "character")
})

# Test that the 'product_vendor' column is character type
test_that("'product_vendor' is character", {
  expect_type(data$product_vendor, "character")
})



# Test that 'product_name' contains unique values (no duplicates)
test_that("'product_name' column contains unique values", {
  expect_equal(length(unique(data$product_name)), 1)
})

# Test that 'product_vendor' contains only valid vendor names
valid_vendors <- c("NoFrills","Loblaws")
test_that("'product_vendor' contains valid vendor names", {
  expect_true(all(data$product_vendor %in% valid_vendors))
})

# Test that there are no empty strings in 'product_name' or 'product_vendor'columns
test_that("no empty strings in 'product_name' or 'product_vendor' columns", {
  expect_false(any(data$product_name == "" | data$product_vendor == ""))
})

# Test that the 'product_vendor' column contains at least 2 unique values
test_that("'product_vendor' column contains at least 2 unique values", {
  expect_true(length(unique(data$product_vendor)) >= 2)
})