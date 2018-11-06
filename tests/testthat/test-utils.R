context("utils")

test_that("utils", {
  expect_error(check_colour("b"), "b is not a valid color")
  expect_error(check_colour("#000"), "#000 is not a valid color")
})
