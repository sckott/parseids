#' Get DOIs prefixes
#'
#' @export
#' @param x (character) a character vector of strings with DOIs
#' @return DOI prefixes (character)
#' @examples
#' pid_dois_prefixes("10.1094/PHYTO-04-17-0144-R")
#' pid_dois_prefixes(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
#' pid_dois_prefixes(dois[1:500])
#' 
#' # lots
#' dois_long <- unlist(replicate(100, dois, simplify = FALSE), TRUE)
#' length(dois_long)
#' system.time(pid_dois_prefixes(dois_long))
pid_dois_prefixes <- function(x) {
  assert_is(x, "character")
  doi_prefixes_many(x)
}
