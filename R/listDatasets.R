#' List datasets in a spreadsheet
#' @name browseDatasets
#' @export

listDatasets <- function(drop.defaults=FALSE) {

  # get dataset info
  package <- getDatasetInfo()

  # drop these to avoid warnings
  package <- setdiff(package, c("base", "stats"))

  if (drop.defaults == TRUE) {
    # remove data available by default
    package <- setdiff(package, "datasets")
  }

  # view result
  View(data(package = package)$result)
}
