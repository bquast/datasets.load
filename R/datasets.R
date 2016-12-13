#' View datasets from all installed package
#' @name datasets
#' @export

datasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {
  package <- getDatasetInfo(package, lib.loc, all, drop.defaults)
  package$LibPath <- NULL
  return(package)
}
