#' Print function for datasets class objects
#' @name print.datasets
#' @importFrom utils View
#' @export

print.datasets <- function(x, ...) {
  utils::View(x, title='datasets')
}
