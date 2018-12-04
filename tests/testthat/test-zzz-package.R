context("tinter")

test_that("package", {
  expect_length(tinter("blue", 10, 1, adjust = 0.2), 19)
  expect_length(tinter("blue", 10, 1, "shades", adjust = 0.1), 10)
  expect_length(tinter("blue", 10, 1, "tints", adjust = 0.2), 10)

  expect_true("#1381C2" %in% tinter("#1381c2"))
  expect_false("#1381C2" %in% tinter("#1381c2", adjust = 0.1))
  expect_false("#1381C2" %in% tinter("#1381c2", adjust = 0.1))


  expect_true("#1381C2" %in% tinter("#1381c2", direction = "shades"))
  expect_true("#1381C2" %in% tinter("#1381c2", direction = "tints"))

  expect_true("#FFFFFF" %in% tinter("#1381c2", crop = 0))
  expect_true("#000000" %in% tinter("#1381c2", crop = 0))

  expect_is(tinter("blue"), "character")

  expect_length(darken(tinter("blue"), amount = 0.1), 9L)
  expect_length(lighten(tinter("blue"), amount = 0.1), 9L)

})
