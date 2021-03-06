context("wp_trend()")
# ----------------------------------------------------------

test_that("wp_trend()", {
  expect_silent(
    wp_trend(page = "Test")
  )
  
  expect_silent(
   res <- wp_trend(page = "Test", from = "2016-01-01", to = "2016-01-01")
  )
  
  expect_silent(
    plot(res)
  )
  
  expect_silent({
    print.wp_df(1)
    print.wp_df(res) 
  })
  
})













