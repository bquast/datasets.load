#' Print function for datasets class objects
#' @name print.datasets
#' @param x an object used to select a method.
#' @param ... further arguments passed to or from other methods.
#' @export

print.datasets <- function(x, ...) {
  View(x, title='datasets')
}
