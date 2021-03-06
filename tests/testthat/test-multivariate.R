context("test-multivariate.R")

test_that("multiple univariate", {
  expect_equal(sort(mbl_multi$key), c("fdeaths", "mdeaths"))
  expect_s3_class(mbl_multi[[as.character(attr(mbl_multi,"models")[[1]])]], "lst_mdl")
  
  expect_equal(sort(unique(fbl_multi$key)), c("fdeaths", "mdeaths"))
  expect_s3_class(fbl_multi[[as.character(attr(fbl_multi,"dist"))]], "fcdist")
})
