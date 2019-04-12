source("hex.R")
devtools::test()
devtools::document()
knitr::knit("README.Rmd")
if(TRUE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
### pkgdown absolute path issue unresolved - this is a workaround so CRAN checks pass
unlink("README_files", recursive = TRUE)
unlink("figure", recursive = TRUE)

devtools::check()
