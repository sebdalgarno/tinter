
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

### What can it do?

`tinter` is a simple package that solves a simple problem.

Turn a colour…

``` r
hex <- "#ed0a4f"
```

![](man/figures/README-colour-1.png)<!-- -->

…into a monochromatic palette **in both directions**…

``` r
tinter(hex)
#> [1] "#FBCEDB" "#F79DB8" "#F46C95" "#F03B72" "#ED0A4F" "#BD083F" "#8E062F"
#> [8] "#5E031F" "#2F020F"
```

![](man/figures/README-tinter-1.png)<!-- -->

… or **one direction**.

``` r
tinter(hex, direction = "tints")
```

![](man/figures/README-tints-1.png)<!-- -->

Adjust number of colours in output…

``` r
tinter(hex, steps = 10)
```

![](man/figures/README-steps-1.png)<!-- -->

…and cropped from palette extremes.

``` r
tinter(hex, steps = 10, crop = 7)
```

![](man/figures/README-crop-1.png)<!-- -->

**A couple of notes:**

1.  The default is for black and white to be removed from the palette
    (e.g. `crop = 1`).

2.  The `steps` argument indicates how many colours to add *on either
    side* (e.g. `steps = 5` results in 11 colurs when `direction =
    "both"` and 6 colours when `direction = "shades"`).

### How is it used in the wild?

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

### Doesn’t this exist already?

`tinter` just simplifies a task usually done with `grDevices`. It’s
default is to remove black and white from the palette.

``` r
tinter("blue")
#> [1] "#CCCCFF" "#9999FF" "#6666FF" "#3333FF" "#0000FF" "#0000CC" "#000099"
#> [8] "#000065" "#000032"

### ------ is identical to

grDevices::colorRampPalette(colors = c("white", "blue", "black"))(11)[-(c(1, 11))]
#> [1] "#CCCCFF" "#9999FF" "#6565FF" "#3232FF" "#0000FF" "#0000CB" "#000098"
#> [8] "#000065" "#000032"
```

``` r
tinter("blue", direction = "shades")
#> [1] "#0000FF" "#0000CC" "#000099" "#000065" "#000032"

### --- is identical to

grDevices::colorRampPalette(colors = c("blue", "black"))(6)[-6]
#> [1] "#0000FF" "#0000CC" "#000099" "#000065" "#000032"
```

``` r
tinter("blue", crop = 2)
#> [1] "#9999FF" "#6666FF" "#3333FF" "#0000FF" "#0000CC" "#000099" "#000065"

### --- is identical to

grDevices::colorRampPalette(colors = c("white", "blue", "black"))(11)[-(c(1:2, 10:11))]
#> [1] "#9999FF" "#6565FF" "#3232FF" "#0000FF" "#0000CB" "#000098" "#000065"
```

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
