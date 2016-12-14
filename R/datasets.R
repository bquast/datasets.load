#' View datasets from all installed package
#' @name datasets
#' @param package a character vector with the names of packages to search through, or NULL in which "all" packages (as defined by argument all) are searched.
#' @param lib.loc a character vector of directory names of R libraries, or NULL. The default value of NULL corresponds to all libraries currently known.
#' @param all logical; if TRUE search all available packages in the library trees specified by lib.loc, and if FALSE, search only attached packages.
#' @param drop.defaults logical; if TRUE, do not include the datasets from the datasets package.
#' @export
#' @examples
#' # write data.frame of datasets to object
#' dtsts <- datasets()
#'

datasets <- function(package = NULL, lib.loc = NULL, all=TRUE, drop.defaults=FALSE) {
  package <- getDatasetInfo(package, lib.loc, all, drop.defaults)
  package$LibPath <- NULL
  return(package)
}
