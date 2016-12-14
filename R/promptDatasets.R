#' Prompt for dataset in the console
#' @name promptDatasets
#' @importFrom utils data menu
#' @export

promptDatasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {

  # return dataset info
  dtsts <- datasets(package, lib.loc, all, drop.defaults)

  # prompt which dataset to load
  choice <- utils::menu(dtsts[,3])

  # find corresponding package
  pkgs <- dtsts[choice,1]

  # find corresponding dataset
  dtsts <- dtsts[choice,2]

  return( utils::data(list=dtsts, package=pkgs) )

}
