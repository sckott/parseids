# get some 
library(dplyr)
src <- src_postgres("ITIS", "localhost", 5432)
auth <- tbl(src, "taxon_authors_lkp")
# to get same set each time, change to get diff. set
set.seed(9) 
(pg_authorities <- auth %>% 
  select(taxon_author) %>%
  collect() %>% 
  .$taxon_author %>% 
  sample(size = 1000, replace = FALSE)
)
pg_authorities <- 
  pg_authorities[stringi::stri_enc_isascii(pg_authorities)]
save(pg_authorities, file = "data/pg_authorities.rda")
# library(stringi)
# stringi::stri_enc(
#   stringi::stri_enc_toutf8(pg_authorities)
# )
#tools::showNonASCII(pg_authorities)