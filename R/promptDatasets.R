#' Prompt for dataset in the console
#' @name promptDatasets
#' @export

promptDatasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # return dataset info
  dtsts <- datasets(package, lib.loc, all, drop.defaults)

  # prompt which dataset to load
  choice <- menu(dtsts[,3])

  # find corresponding package
  pkgs <- dtsts[choice,1]

  # find corresponding dataset
  dtsts <- dtsts[choice,2]

  return( data(list=dtsts, package=pkgs) )

}
