#' Get information on installed datasets.
#' @name getDatasetInfo
#' @export

getDatasetInfo <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  if (is.null(package)) {
    package <- .packages(all.available = all, lib.loc)

    # drop these to avoid warnings
    package <- setdiff(package, c("base", "stats"))

    # remove data available by default if specified
    if (drop.defaults == TRUE) {
      package <- setdiff(package, "datasets")
    }

    # this doesn't do anything here
    paths <- find.package(package, lib.loc, quiet = TRUE)
  }
  else { # this doesn't work yet
    paths <- find.package(package, lib.loc)
  }

  # extract datasets info
  package <- data(package = package)$result

  return(package)

}
