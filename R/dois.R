#' DOI parsing
#'
#' @export
#' @param x a character vector of strings with DOIs in them
#' @details when not found, returns an empty string
#' @examples
#' pid_dois("Foo 10.1094/PHYTO-04-17-0144-R hello")
#' pid_dois("10.1094/PHYTO-04-17-0144-R hello")
#' pid_dois(" bar 10.1094/PHYTO-04-17-0144-R")
#' pid_dois("bar 10.1094/PHYTO-04-17-0144-R")
#' pid_dois("bar bar 10.1094/PHYTO-04-17-0144-R")
#' pid_dois("bar bar foo bar 10.1094/PHYTO-04-17-0144-R")
#' pid_dois(" 10.1094/PHYTO-04-17-0144-R ")
#' pid_dois("10.1094/PHYTO-04-17-0144-R")
#' pid_dois("10.1094/PHYTO")
#' pid_dois("10.10944/2")
#' pid_dois("10.1094")
#' 
#' # many
#' pid_dois(c("10.1094/PHYTO-04-17-0144-R", "10.1094/PHYTO"))
#' ## sample data, 1000 DOIs
#' dois
#' pid_dois(dois)
#' system.time(replicate(10, pid_dois(dois)))
pid_dois <- function(x) {
  doi_parse_many(x)
}
