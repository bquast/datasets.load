browseDatasets()

test_that("output format matches", {
  expect_equal( length(alldata()), 4),
  expect_equal( length(datasets()), 3)
})
