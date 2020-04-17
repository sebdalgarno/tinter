
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinter <img src="https://raw.githubusercontent.com/poissonconsulting/tinter/master/docs/logo.png"  align="right" width='15%'/>

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/poissonconsulting/tinter.svg?branch=master)](https://travis-ci.org/poissonconsulting/tinter)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/sebdalgarno/tinter?branch=master&svg=true)](https://ci.appveyor.com/project/sebdalgarno/tinter)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/tinter/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/tinter?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/tinter)](https://cran.r-project.org/package=tinter)
![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/tinter)

### Introduction

`tinter` provides a simple way to generate monochromatic palettes.
Easily define:

  - palette direction (“shades”, “tints”, or “both”).
  - number of colours to generate on either side (`steps`).
  - number of colours to remove from extreme end(s) of palette
    (e.g. default `crop = 1` eliminates black and white).
  - darker or lighter output (`adjust`).

<!-- end list -->

``` r
library(tinter)
hex <- "#335CAC"
```

![](tools/README-colour-1.png)<!-- -->

``` r
tinter(hex)
#> [1] "#D6DEEE" "#ADBDDD" "#849DCD" "#5B7CBC" "#335CAC" "#284989" "#1E3767"
#> [8] "#142444" "#0A1222"
```

![](tools/README-tinter-1.png)<!-- -->

``` r
tinter(hex, direction = "tints")
```

![](tools/README-tints-1.png)<!-- -->

``` r
tinter(hex, steps = 10)
```

![](tools/README-steps-1.png)<!-- -->

``` r
tinter(hex, steps = 10, crop = 7)
```

![](tools/README-crop-1.png)<!-- -->

``` r
tinter(hex, steps = 10, crop = 7, adjust = 0.4)
```

![](tools/README-darken-1.png)<!-- -->

### Create a choropleth map

``` r
library(ggplot2)
library(sf)

nc <- st_read(system.file(package = "sf", "shape/nc.shp"))

ggplot(data = nc) +
  geom_sf(aes(fill = AREA), colour = "white", lwd = 0.04) +
  # colours from tinter
  scale_fill_gradientn(colours = tinter(hex)) +
  theme_void() +
  coord_sf(datum = NA)
```

![](tools/README-plot-1.png)<!-- -->

### Doesn’t this already exist?

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

To install the latest release from [CRAN](https://cran.r-project.org)

``` r
install.packages("tinter")
```

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/tinter)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/tinter")
```

To install the latest developmental release from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

``` r
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("tinter")
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/tinter/issues).

[Pull requests](https://github.com/poissonconsulting/tinter/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/tinter/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
