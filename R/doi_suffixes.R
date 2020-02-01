#' Get DOI suffixes
#'
#' @export
#' @param x (character) a character vector of strings with DOIs
#' @return DOI suffixes (character)
#' @examples
#' pid_dois_suffixes("10.1094/PHYTO-04-17-0144-R")
#' pid_dois_suffixes(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
#'
#' # compare to manually pulled out suffixes
#' foo <- function(z) {
#'  tmp <- strsplit(z, "/")[[1]]
#'  if (length(tmp) > 2) paste0(tmp[2:length(tmp)], collapse = "/") else tmp[2]
#' }
#' x <- vapply(dois[1:500], foo, "", USE.NAMES = FALSE)
#' identical(pid_dois_suffixes(dois[1:500]), x)
#'
#' # lots
#' dois_long <- unlist(replicate(100, dois, simplify = FALSE), TRUE)
#' length(dois_long)
#' system.time(pid_dois_suffixes(dois_long))
#' system.time(vapply(dois_long, foo, "", USE.NAMES = FALSE))
pid_dois_suffixes <- function(x) {
  assert_is(x, "character")
  doi_suffixes_many(x)
}
