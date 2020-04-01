source("hex.R")

roxygen2md::roxygen2md()

styler::style_pkg(filetype = c("R", "Rmd"))

devtools::test()
devtools::document()
# knitr::knit("README.Rmd")
if(FALSE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
devtools::check()

