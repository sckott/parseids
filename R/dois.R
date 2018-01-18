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
#' 
#' # with http and variants
#' pid_dois("http://doi.org/10.1094/PHYTO-04-17-0144-R")
#' pid_dois("https://doi.org/10.1094/PHYTO-04-17-0144-R")
#' pid_dois("doi.org/10.1094/PHYTO-04-17-0144-R")
#' 
#' # hard ones
#' ## works when just text or numbers
#' pid_dois('an old Wiley DOI 10.1002/(SICI)1096-8644(199601)99:1<135::AID-AJPA8>3.0.CO;2-#')
#' pid_dois('99 Wiley DOIs 10.1002/(SICI)1096-8644(199601)99:1<135::AID-AJPA8>3.0.CO;2-#')
#' ## but doesn't if there's any symbols
#' pid_dois('(This is an example of a DOI: 10.1130/2013.2502).')
#' pid_dois('an old Wiley DOI: 10.1002/(SICI)1096-8644(199601)99:1<135::AID-AJPA8>3.0.CO;2-#')
#' 
#' # many
#' pid_dois(c("10.1094/PHYTO-04-17-0144-R", "10.1094/PHYTO"))
#' ## sample data, 1000 DOIs
#' dois
#' pid_dois(dois)
#' system.time(replicate(10, pid_dois(dois)))
#' 
#' # shouldn't work - returns empy string
#' pid_dois("10.1094")
#' 

pid_dois <- function(x) {
  doi_parse_many(x)
}
