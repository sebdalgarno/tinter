
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinter <img src="man/figures/logo.png" align="right" width='15%'/>

<!-- [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) -->

<!-- [![Travis build status](https://travis-ci.org/sebdalgarno/tinter.svg?branch=master)](https://travis-ci.org/sebdalgarno/tinter) -->

<!--  [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/sebdalgarno/tinter?branch=master&svg=true)](https://ci.appveyor.com/project/sebdalgarno/tinter) -->

<!--  [![Coverage status](https://codecov.io/gh/sebdalgarno/tinter/branch/master/graph/badge.svg)](https://codecov.io/github/sebdalgarno/tinter?branch=master) -->

<!-- [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) -->

`tinter` is a simple package that solves a simple problem.

From a single colour…

``` r
library(tinter)
hex <- "#1381c2"
```

![](man/figures/README-colour-1.png)<!-- -->

create a monochromatic palette *in both directions*…

``` r
tinter(hex)
#> [1] "#CFE5F2" "#A0CCE6" "#71B3DA" "#429ACE" "#1381C2" "#0F679B" "#0B4D74"
#> [8] "#07334D" "#031926"
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

Create palette for a choropleth
map.

``` r
ggplot2::ggplot(data = sf::st_read(system.file(package = "sf", "shape/nc.shp"))) +
  ggplot2::geom_sf(ggplot2::aes(fill = AREA), colour = "black", lwd = 0.01) +
  ggplot2::scale_fill_gradientn(colours = tinter(hex))
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
