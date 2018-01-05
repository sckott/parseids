#' DOI parsing
#'
#' @export
#' @param x a character vector of strings with DOIs in them
#' @details when not found, returns an empty string
#' @examples
#' pid_doi("Foo 10.1094/PHYTO-04-17-0144-R hello")
#' pid_doi("10.1094/PHYTO-04-17-0144-R hello")
#' pid_doi(" bar 10.1094/PHYTO-04-17-0144-R")
#' pid_doi("bar 10.1094/PHYTO-04-17-0144-R")
#' pid_doi("bar bar 10.1094/PHYTO-04-17-0144-R")
#' pid_doi("bar bar foo bar 10.1094/PHYTO-04-17-0144-R")
#' pid_doi(" 10.1094/PHYTO-04-17-0144-R ")
#' pid_doi("10.1094/PHYTO-04-17-0144-R")
#' pid_doi("10.1094/PHYTO")
#' pid_doi("10.10944/2")
#' pid_doi("10.1094")
#' 
#' # many
#' pid_doi(c("10.1094/PHYTO-04-17-0144-R", "10.1094/PHYTO"))
#' ## sample data, 1000 DOIs
#' dois
#' pid_doi(dois)
#' system.time(replicate(10, pid_doi(dois)))
pid_doi <- function(x) {
  doi_parse_many(x)
}
