source("hex.R")
devtools::test()
devtools::document()
# knitr::knit("README.Rmd")
if(FALSE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
devtools::check()
