context("tinter")

test_that("package", {

  expect_length(tinter("blue", 10, 1), 19)
  expect_length(tinter("blue", 10, 1, "shades"), 10)
  expect_length(tinter("blue", 10, 1, "tints"), 10)

  expect_true("#1381C2" %in% tinter("#1381c2"))
  expect_true("#1381C2" %in% tinter("#1381c2", direction = "shades"))
  expect_true("#1381C2" %in% tinter("#1381c2", direction = "tints"))

  expect_true("#FFFFFF" %in% tinter("#1381c2", crop = 0))
  expect_true("#000000" %in% tinter("#1381c2", crop = 0))

  expect_is(tinter("blue"), "character")

})
