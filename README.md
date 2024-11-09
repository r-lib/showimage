


# showimage

> Show an Image on an R Graphics Device

<!-- badges: start -->
[![R-CMD-check](https://github.com/r-lib/showimage/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-lib/showimage/actions/workflows/R-CMD-check.yaml)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![](https://www.r-pkg.org/badges/version/showimage)](https://www.r-pkg.org/pkg/showimage)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/showimage)](https://www.r-pkg.org/pkg/showimage)
[![Codecov test coverage](https://codecov.io/gh/r-lib/showimage/graph/badge.svg)](https://app.codecov.io/gh/r-lib/showimage)
<!-- badges: end -->

Sometimes it is handy to be able to view an image file on an
R graphics device. This package just does that. Currently it supports
PNG files.

## Installation

Stable version:


```r
devtools::install_github("r-lib/showimage")
```

Development version:


```r
pak::pak("r-lib/showimage")
```

## Usage


```r
library(showimage)
png(tmp <- tempfile(fileext = ".png"))
pairs(iris)
dev.off()
show_image(tmp)
```

![plot of chunk screenshot](./screenshot-1.png)

## License

GPL-2 | GPL-3 © [Mango Solutions](https://github.com/mangothecat),
Simon Urbanek, [RStudio](https://github.com/rstudio)
