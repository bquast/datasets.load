#' List datasets in an HTML Browser
#' @name browseDatasets
#' @importFrom utils browseURL
#' @param package a character vector with the names of packages to search through, or NULL in which "all" packages (as defined by argument all) are searched.
#' @param lib.loc a character vector of directory names of R libraries, or NULL. The default value of NULL corresponds to all libraries currently known.
#' @param all logical; if TRUE search all available packages in the library trees specified by lib.loc, and if FALSE, search only attached packages.
#' @param drop.defaults logical; if TRUE, do not include the datasets from the datasets package.
#' @export

browseDatasets <- function(package=NULL, lib.loc=NULL, all=TRUE, drop.defaults=FALSE) {

  dinfo <- getDatasetInfo(package, lib.loc, all, drop.defaults)
  pkgs <- unique(dinfo[, "Package"])
  db <- lapply(pkgs, function(p) dinfo[dinfo[,"Package"] == p,,drop=FALSE])
  names(db) <- pkgs
  attr(db, "call") <- sys.call()
  attr(db, "footer") <-
    if (all) ""
  else sprintf(gettext("Use <code> %s </code> \n to list the datasets in all <strong>available</strong> packages."),
               "browseDatasets(all = TRUE)")
  class(db) <- "browseDatasets"
  return(db)
}

#' Print function for browseDatasets objects
#' @name print.browseDatasets
#' @param x Object of class datasets
#' @param ... Further arguments, ignored by the print method.
#' @export

print.browseDatasets <- function(x, ...)
{
  if (length(x) == 0L) {
    message(gettextf("No Datasets found by %s",
                     paste(deparse(attr(x, "call")), collapse=" ")),
            domain = NA)
    return(invisible(x))
  }

  oneLink <- function(s) {
    if (length(s) == 0L) return(character(0L))
    title <- s[, "Title"]
    if (port > 0L)
      prefix <- sprintf("/library/%s/doc", pkg)
    else
      prefix <- sprintf("file://%s/doc", s[, "Dir"])
    item <- s[, "Item"]
    sprintf("  <li>%s  -  \n    %s  \n  </li>\n",
            title,
            item  )
  }

  port <- tools::startDynamicHelp(NA)

  file <- tempfile("Rvig.", fileext=".html")
  sink(file)
  if (port > 0L)
    css_file <- "/doc/html/R.css"
  else
    css_file <- file.path(R.home("doc"), "html", "R.css")
  cat(sprintf("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<title>R Datasets</title>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<link rel='stylesheet' type='text/css' href='%s'>
</head>
<body>\n", css_file))
  cat(sprintf("<h2>Datasets found by <code><q>%s</q></code></h2>",
              paste(deparse(attr(x, "call")), collapse=" ")))
  cat("<div class=\"Datasets\">")
  for (pkg in names(x))
  {
    cat(sprintf("<h3>Datasets in package <code>%s</code></h3>\n", pkg))
    cat("<ul>\n")
    links <- oneLink(x[[pkg]])
    cat(paste(links), collapse = "\n")
    cat("\n</ul>\n")
  }
  cat("</div>")
  cat(sprintf("<hr/><p>%s</p>", attr(x, "footer")))
  cat("</body></html>\n")
  sink()
  ## the first two don't work on Windows with browser=NULL.
  ## browseURL(URLencode(sprintf("file://%s", file)))
  ## browseURL(URLencode(file))
  if (port > 0L)
    utils::browseURL(sprintf("http://127.0.0.1:%d/session/%s", port, basename(file)))
  else
    utils::browseURL(sprintf("file://%s", file))
  ## browseURL(file)
  invisible(x)
}
