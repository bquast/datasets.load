#' Prompt for dataset in the console
#' @name promptDatasets
#' @export

promptDatasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # return dataset info
  dtsts <- getDatasetInfo(package, lib.loc, all, drop.defaults)

  # prompt which dataset to load
  choice <- menu(dtsts[,3])

  # find corresponding package
  pkg <- dtsts[choice,][1]

  # find corresponding dataset
  dtsts[choice,][3]

}
