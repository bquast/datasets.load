#' List Vignettes in an HTML Browser
#' @name browseDatasets
#' @export

datasets <- function(drop.defaults=FALSE) {

  # get dataset info
  package <- getDatasetInfo()

  package <- setdiff(package, c("base", "stats"))

  if (drop.defaults == TRUE) {
    # remove data available by default
    # package <- setdiff(package, "datasets")
  }

  # return result
  data(package = package)
}
