browseDatasets()

test_that("output format matches", {
  expect_equal( length(alldata()), 4 )
})
