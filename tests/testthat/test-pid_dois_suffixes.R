context("pid_dois_suffixes")
test_that("pid_dois_suffixes works as expected", {
  aa <- pid_dois_suffixes("10.1094/PHYTO-04-17-0144-R")
  bb <- pid_dois_suffixes("10.13051/ee:doc/muralolo0040107a1c")
  
  expect_is(aa, 'character')
  expect_is(bb, 'character')
  
  expect_false(grepl('10\\.', aa))
  expect_false(grepl('10\\.', bb))
  
  expect_match(aa, "PHYTO")
  expect_match(bb, "muralolo")
})

test_that("pid_dois_suffixes accepts many inputs", {
  aa <- pid_dois_suffixes(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
  expect_is(aa, 'character')
  expect_equal(length(aa), 2)
  expect_false(all(grepl("10\\.", aa)))
})
