#' Get information on installed datasets.
#' @name getDatasetInfo
#' @export

getDatasetInfo <- function(package = NULL, lib.loc = NULL, all=TRUE) {
  if (is.null(package)) {
    package <- .packages(all.available = all, lib.loc)
    paths <- find.package(package, lib.loc, quiet = TRUE)
  }
  else {
    paths <- find.package(package, lib.loc)
  }
  return(package)
}
