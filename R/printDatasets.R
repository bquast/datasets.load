#' Print datasets in the console
#' @name printDatasets
#' @export

printDatasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # return dataset info
  getDatasetInfo(package, lib.loc, all, drop.defaults)

}
