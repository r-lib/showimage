


# showimage

> Show an Image on an R Graphics Device

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Linux Build Status](https://travis-ci.org/r-lib/showimage.svg?branch=main)](https://travis-ci.org/r-lib/showimage)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/r-lib/showimage?svg=true)](https://ci.appveyor.com/project/gaborcsardi/showimage)
[![](http://www.r-pkg.org/badges/version/showimage)](http://www.r-pkg.org/pkg/showimage)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/showimage)](http://www.r-pkg.org/pkg/showimage)
[![Coverage Status](https://img.shields.io/codecov/c/github/r-lib/showimage/main.svg)](https://codecov.io/github/r-lib/showimage?branch=main)


Sometimes it is handy to be able to view an image file on an
R graphics device. This package just does that. Currently it supports
PNG files.

## Installation


```r
devtools::install_github("r-lib/showimage")
```

## Usage


```r
library(showimage)
png(tmp <- tempfile(fileext = ".png"))
pairs(iris)
dev.off()
show_image(tmp)
```

![plot of chunk unnamed-chunk-2](./unnamed-chunk-2-1.png)

## License

GPL-2 | GPL-3 © [Mango Solutions](https://github.com/mangothecat),
Simon Urbanek, [RStudio](https://github.com/rstudio)
