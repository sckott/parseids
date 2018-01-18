#' Split DOIs into their pieces
#'
#' @export
#' @keywords internal
#' @param x a character vector of strings with DOIs in them
#' @details when not found, returns an empty string
#' @examples
#' ## split DOIs
#' # pid_dois_split("10.1094/PHYTO-04-17-0144-R")
#' # vapply(dois[1:10], pid_dois_split, "")
#' # pid_dois_split(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
pid_dois_split <- function(x) {
  stop("not working yet")
  doi_split_many(x)
}
