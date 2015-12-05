
test_that("Result is a number",{
  expect_true(is.numeric(jakaCena("Kia", 2010)))
})

test_that("An invalid number of parameters",{
  expect_error(jakaCena())
  expect_error(jakaCena("Kia"))
})

test_that("Results are correct",{
  expect_equal(round(jakaCena("Kia", 2010)),
               44544)
  expect_equal(round(jakaCena("Kia", 2011)),
               65989)
})
