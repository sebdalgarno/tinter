
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinter <img src="man/figures/logo.png" align="right" width='15%'/>

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/poissonconsulting/tinter.svg?branch=master)](https://travis-ci.org/poissonconsulting/tinter)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/tinter?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/tinter)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/tinter/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/tinter?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

`tinter` is a simple package that solves a simple problem.

From a single colour…

``` r
library(tinter)

hex <- "#ed0a4f"
```

![](man/figures/README-colour-1.png)<!-- -->

create a monochromatic palette *in both directions*…

``` r
tinter(hex)
#> [1] "#FBCEDB" "#F79DB8" "#F46C95" "#F03B72" "#ED0A4F" "#BD083F" "#8E062F"
#> [8] "#5E031F" "#2F020F"
```

![](man/figures/README-tinter-1.png)<!-- -->

or just one direction.

``` r
tinter(hex, direction = "shades")
```

![](man/figures/README-shades-1.png)<!-- -->

``` r
tinter(hex, direction = "tints")
```

![](man/figures/README-tints-1.png)<!-- -->

Adjust number of colours in output.

``` r
tinter(hex, steps = 10)
```

![](man/figures/README-steps-1.png)<!-- -->

Adjust number of colours cropped from palette extremes.

``` r
tinter(hex, steps = 10, crop = 7)
```

![](man/figures/README-crop-1.png)<!-- -->

Create palette for a choropleth map.

``` r
library(ggplot2)
library(sf)

nc <- st_read(system.file(package = "sf", "shape/nc.shp"))

ggplot(data = nc) +
  geom_sf(aes(fill = AREA), colour = "white", lwd = 0.05) +
  # colours from tinter
  scale_fill_gradientn(colours = tinter(hex)) +
  theme_void() +
  coord_sf(datum = NA)
```

![](man/figures/README-plot-1.png)<!-- -->

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/tinter)

    install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")
    devtools::install_github("poissonconsulting/tinter")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("tinter")

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/tinter/issues).

[Pull requests](https://github.com/poissonconsulting/tinter/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms
