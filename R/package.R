
#' Show an Image on an R Graphics Device
#'
#' @param file Name of the image file to show.
#' @param mar Margin, the `mar` parameter, see `par`.
#' @param axes Whether to show the axes. You need to increase the
#'   margin to see the axis labels.
#' @param frame.plot Whether to draw a frame around the plot.
#' @param asp Aspect ratio parameter for `plot`. If `NULL`,
#'   then the original aspect ratio of the image is used.
#' @param ... Additonal arguments are passed to `plot`.
#' @return Nothing.
#'
#' @importFrom png readPNG
#' @importFrom tools file_ext
#' @importFrom grDevices as.raster dev.cur
#' @importFrom graphics par plot rasterImage
#' @export
#' @examples
#' rlogo <- system.file("img", "Rlogo.png", package="png")
#' show_image(rlogo)
#'
#' ## Create a plot in a PNG and show it
#' png(tmp <- tempfile(fileext = ".png"))
#' pairs(iris)
#' dev.off()
#' show_image(tmp)

show_image <- function(file, mar = c(0, 0, 0, 0),
                       axes = FALSE, frame.plot = TRUE, asp = NULL, ...) {

  if (!file.exists(file)) stop("File does not exist: ", file)

  ext <- tolower(file_ext(file))

  if (ext == "png") {
    show_image_png(file, mar = mar, axes = axes, frame.plot = frame.plot,
                   asp = asp, ...)

  } else {
    stop("Unknown image type")
  }

  invisible()
}

## This is mostly from the png::readPNG manual page example,
## by Simon Urbanek

show_image_png <- function(file, mar, asp, ...) {

  img <- readPNG(file)

  on.exit(par(oldpar))
  oldpar <- par(mar = mar, oma = c(0, 0, 0, 0))

  if (is.null(asp)) asp <- nrow(img) / ncol(img)

  plot(NA, xlim = c(1, 2), ylim = c(1,2), type = "n", asp = asp, ...)

  if (names(dev.cur()) == "windows") {
    ## windows device doesn't support semi-transparency so we'll need
    ## to flatten the image. We cannot test this, unfortunately
    # nocov start
    transparent <- img[,,4] == 0
    img <- as.raster(img[,,1:3])
    img[transparent] <- NA

    ## interpolate must be FALSE on Windows, otherwise R will
    ## try to interpolate transparency and fail
    rasterImage(img, 1, 1, 2, 2, interpolate=FALSE)
    # nocov end

  } else {
    ## any reasonable device will be fine using alpha
    rasterImage(img, 1, 1, 2, 2)
  }
}
