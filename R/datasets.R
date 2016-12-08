#' List all datasets
#' @name datasets
#' @export

datasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # get dataset info
  package <- getDatasetInfo(package, lib.loc, all, drop.defaults)

  # return result
  data(package = package[, 1])
}
