library(rcrossref)
out <- replicate(10, cr_r(sample = 100), simplify = FALSE)
dois <- do.call(c, out)
devtools::use_data(dois, overwrite = TRUE)
