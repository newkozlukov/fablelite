context("test-mable.R")

test_that("Mable classes", {
  expect_s3_class(mbl, "mdl_df")
  expect_s3_class(mbl[[as.character(attr(mbl,"models")[[1]])]], "lst_mdl")
})

test_that("Mable print output", {
  expect_output(print(mbl), "A mable:")
})

test_that("Mable fitted values", {
  fits <- fitted(mbl)
  expect_true(is_tsibble(fits))
  expect_true(all(colnames(fits) %in% c(".model", "index", ".fitted")))
  expect_equal(fits[["index"]], USAccDeaths[["index"]])
  expect_equal(
    fits[[".fitted"]],
    fitted(mbl[[as.character(attr(mbl,"models")[[1]])]][[1]])[[".fitted"]]
  )
  
  fits <- fitted(mbl_multi)
  expect_true(is_tsibble(fits))
  expect_equal(key_vars(fits), c("key", ".model"))
  expect_true(all(colnames(fits) %in% c("key", ".model", "index", ".fitted")))
  expect_equal(unique(fits[["key"]]), mbl_multi[["key"]])
  expect_equal(fits[["index"]], UKLungDeaths[["index"]])
  expect_equal(fits[[".fitted"]],
               as.numeric(c(
                 fitted(mbl_multi[[as.character(attr(mbl,"models")[[1]])]][[1]])[[".fitted"]],
                 fitted(mbl_multi[[as.character(attr(mbl,"models")[[1]])]][[2]])[[".fitted"]]
               ))
  )
})

test_that("Mable residuals", {
  resids <- residuals(mbl)
  expect_true(is_tsibble(resids))
  expect_true(all(colnames(resids) %in% c(".model", "index", ".resid")))
  expect_equal(resids[["index"]], USAccDeaths[["index"]])
  expect_equal(resids[[".resid"]], as.numeric(residuals(mbl[[as.character(attr(mbl,"models")[[1]])]][[1]])[[".resid"]]))
  
  resids <- residuals(mbl_multi)
  expect_true(is_tsibble(resids))
  expect_equal(key_vars(resids), c("key", ".model"))
  expect_true(all(colnames(resids) %in% c("key", ".model", "index", ".resid")))
  expect_equal(unique(resids[["key"]]), mbl_multi[["key"]])
  expect_equal(resids[["index"]], UKLungDeaths[["index"]])
  expect_equal(resids[[".resid"]], 
               as.numeric(c(
                 residuals(mbl_multi[[as.character(attr(mbl,"models")[[1]])]][[1]])[[".resid"]],
                 residuals(mbl_multi[[as.character(attr(mbl,"models")[[1]])]][[2]])[[".resid"]]
               ))
  )
})

test_that("mable dplyr verbs", {
  expect_output(mbl_complex %>% tsibble::select(key, ets) %>% print, "mable: 2 x 2") %>% 
    colnames %>% 
    expect_identical(c("key", "ets"))
  
  expect_output(mbl_complex %>% tsibble::select(key, ets) %>% print, "mable: 2 x 2") %>% 
    colnames %>% 
    expect_identical(c("key", "ets"))
  
  expect_output(mbl_complex %>% tsibble::filter(key == "mdeaths") %>% print, "mable") %>% 
    .[["key"]] %>% 
    expect_identical("mdeaths")
})