#' List datasets in an HTML Browser
#' @name browseDatasets
#' @export

browseDatasets <- function(drop.defaults=FALSE) {

  # get dataset info
  package <- getDatasetInfo()

  # drop these to avoid warnings
  package <- setdiff(package, c("base", "stats"))

  if (drop.defaults == TRUE) {
    # remove data available by default
    package <- setdiff(package, "datasets")
  }

  # return result
  return(data(package = package)$result)
}
