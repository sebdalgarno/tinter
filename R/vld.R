#' Validate Color String
#'
#' Validates whether x is a string (non-missing character vector of length 1)
#' that specifies a color.
#'
#' @inheritParams chk::chk_true
#' @return A flag indicating whether the object was validated.
#' @seealso \code{\link{chk_color}()}
#' @name vld_color
NULL

#' @describeIn vld_color Validate Color String
#'
#' @export
#'
#' @examples
#'
#' # vld_color
#' vld_color("blue")
#' vld_color("glue")
vld_color <- function(x) {
  vld_string(x) && !inherits(try(grDevices::col2rgb(x), silent = TRUE), "try-error")
}

#' @describeIn vld_color Validate Colour String
#'
#' @export
#'
#' @examples
#'
#' # vld_color
#' vld_colour("blue")
#' vld_colour("glue")
vld_colour <- function(x) {
  vld_color(x)
}
