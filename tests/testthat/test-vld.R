test_that("vld_color", {
  expect_true(vld_color("blue"))
  expect_false(vld_color(1))
  expect_false(vld_color(character(0)))
  expect_false(vld_color(NA_character_))
  expect_false(vld_color(c("blue", "green")))
  expect_false(vld_color("glue"))
})

test_that("vld_colour", {
  expect_true(vld_colour("blue"))
  expect_false(vld_colour(1))
  expect_false(vld_colour(character(0)))
  expect_false(vld_colour(NA_character_))
  expect_false(vld_colour(c("blue", "green")))
  expect_false(vld_colour("glue"))
})
