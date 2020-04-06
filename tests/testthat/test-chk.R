test_that("chk_color", {
  expect_null(chk_color("green"))
  expect_invisible(chk_color("green"))
  chk::expect_chk_error(chk_color(1))
})

test_that("chk_colour", {
  expect_null(chk_colour("green"))
  expect_invisible(chk_colour("green"))
  chk::expect_chk_error(chk_colour(1))
})
