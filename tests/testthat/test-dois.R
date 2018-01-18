context("dois")
test_that("pid_dois works as expected", {
  aa <- pid_dois("10.1094/PHYTO-04-17-0144-R")
  bb <- pid_dois("10.13051/ee:doc/muralolo0040107a1c")

  expect_is(aa, 'character')
  expect_is(bb, 'character')
  
  expect_match(aa, '10\\.')
  expect_match(bb, '10\\.')
})

test_that("pid_dois accepts many inputs", {
  aa <- pid_dois(c("10.1094/PHYTO-04-17-0144-R", "10.1094/PHYTO"))
  expect_is(aa, 'character')
  expect_equal(length(aa), 2)
  expect_match(aa, "10\\.")
})


context("pid_dois_prefixes")
test_that("pid_dois_prefixes works as expected", {
  aa <- pid_dois_prefixes("10.1094/PHYTO-04-17-0144-R")
  bb <- pid_dois_prefixes("10.13051/ee:doc/muralolo0040107a1c")
  
  expect_is(aa, 'character')
  expect_is(bb, 'character')
  
  expect_match(aa, '10\\.')
  expect_match(bb, '10\\.')
})

test_that("pid_dois_prefixes accepts many inputs", {
  aa <- pid_dois_prefixes(c("10.1094/PHYTO-04-17-0144-R", "10.1094/PHYTO"))
  expect_is(aa, 'character')
  expect_equal(length(aa), 2)
  expect_match(aa, "10\\.1094")
})



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
