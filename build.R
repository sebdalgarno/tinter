source("hex.R")
devtools::test()
devtools::document()
knitr::knit("README.Rmd")
if(TRUE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
# need to resolve pkgdown path issue before submitting to cran for update

devtools::check()
