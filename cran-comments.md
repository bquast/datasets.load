## Test environments
* local Windows 7 install, R 3.3.2
* local Linux (Arch) install, R 3.3.2
* win-builder (devel and release)

## R CMD check results

* checking for code which exercises the package ... WARNING
No examples, no tests, no vignettes
* DONE
Status: 1 WARNING, 2 NOTEs
R CMD check succeeded

The package includes only utilities, examples are not insighful.

Possibly mis-spelled words in DESCRIPTION:
  Datasets (2:30)
  RStudio (5:55)
  datasets (5:43)
  
I use the spelling datasets instead of data sets, it is also the package name.]
RStudio is the name of the IDE (a product).

print.datasets: no visible global function definition for 'View'
Undefined global functions or variables:
  View
Consider adding
  importFrom("utils", "View")
to your NAMESPACE file.

I intentionally do not import View from utils, so that RStudio can override this function.

I have included URLs that do not exist yet, but will exist once the package is accepted.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.
