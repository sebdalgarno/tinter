
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinter <img src="man/figures/logo.png" align="right" width='15%'/>

<!-- [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) -->

<!-- [![Travis build status](https://travis-ci.org/sebdalgarno/tinter.svg?branch=master)](https://travis-ci.org/sebdalgarno/tinter) -->

<!--  [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/sebdalgarno/tinter?branch=master&svg=true)](https://ci.appveyor.com/project/sebdalgarno/tinter) -->

<!--  [![Coverage status](https://codecov.io/gh/sebdalgarno/tinter/branch/master/graph/badge.svg)](https://codecov.io/github/sebdalgarno/tinter?branch=master) -->

<!-- [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) -->

`tinter` is a simple package that solves a simple problem.

From a single colour:

``` r
library(tinter)
hex <- "#1381c2"
```

![](man/figures/README-unnamed-chunk-1-1.png)<!-- -->

Create a monochromatic palette extending *in both directions*.

``` r
tinter(hex)
#> [1] "#CFE5F2" "#A0CCE6" "#71B3DA" "#429ACE" "#1381C2" "#0F679B" "#0B4D74"
#> [8] "#07334D" "#031926"
```

![](man/figures/README-tinter-1.png)<!-- -->

Or just one direction.

``` r
tinter(hex, direction = "shades")
```

![](man/figures/README-unnamed-chunk-3-1.png)<!-- -->

``` r
tinter(hex, direction = "tints")
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

Adjust number of colours in output.

``` r
tinter(hex, steps = 10)
```

![](man/figures/README-steps-1.png)<!-- -->

Adjust the number of colours cropped from extreme ends of palette.

``` r
tinter(hex, steps = 10, crop = 7)
```

![](man/figures/README-crop-1.png)<!-- -->

Use tinter to create a palette for a choropleth map.

``` r
ggplot2::ggplot() +
  ggplot2::geom_sf(data = sf::st_read(system.file(package = "sf", "shape/nc.shp")), ggplot2::aes(fill = AREA)) +
  ggplot2::scale_fill_gradientn(colours = tinter(hex))
#> Reading layer `nc' from data source `/Library/Frameworks/R.framework/Versions/3.5/Resources/library/sf/shape/nc.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 100 features and 14 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -84.32385 ymin: 33.88199 xmax: -75.45698 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
```

![](man/figures/README-plot-1.png)<!-- -->

Please note that the `tinter` project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
