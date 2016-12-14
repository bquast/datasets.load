## Test environments
* local Windows 7 install, R 3.3.2
* local Linux (Arch) install, R 3.3.2
* win-builder (devel and release)

## R CMD check results

checking R code for possible problems ... NOTE
print.datasets: no visible global function definition for 'View'
Undefined global functions or variables:
  View
Consider adding
  importFrom("utils", "View")
to your NAMESPACE file.
R CMD check results
0 errors | 0 warnings | 1 note 

R CMD check succeeded

I intentionally do not import View from utils, so that RStudio can override this function.

I have included URLs that do not exist yet, but will exist once the package is accepted.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.
