context("utils")

test_that("utils", {

  expect_error(check_colour("b"), "b is not a valid color")
  expect_error(check_colour("#000"), "#000 is not a valid color")

  expect_error(check_steps(1.1), "steps must be class integer")
  expect_error(check_steps(-1), "the values in steps must lie between 0 and 2147483647")
  expect_error(check_steps(c(1,1)), "steps must have 1 element")


  expect_error(check_crop(1.1), "crop must be class integer")
  expect_error(check_crop(-1), "the values in crop must lie between 0 and 2147483647")
  expect_error(check_crop(c(1, 1)), "crop must have 1 element")

  expect_error(check_direction("none"), "direction can only include values 'both', 'shades' or 'tints'")

})
