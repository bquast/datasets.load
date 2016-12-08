#' List datasets in a spreadsheet
#' @name browseDatasets
#' @export

listDatasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # get dataset info
  package <- getDatasetInfo(package, lib.loc, all, drop.defaults)

  # view result
  View(package, 'datasets')
}
