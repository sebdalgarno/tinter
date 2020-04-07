#' Check Color String
#'
#' Checks that x is a string (non-missing character vector of length 1)
#' that specifies a color.
#'
#' @inheritParams chk::chk_true
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso [vld_color()]
#' @name chk_color
NULL

#' @describeIn chk_color Check Color String Object
#'
#' @description
#'
#' `chk_color`
#' checks if a color string.
#'
#' @export
#'
#' @examples
#'
#' # chk_color
#' chk_color("blue")
#' try(chk_color("glue"))
chk_color <- function(x, x_name = NULL) {
  if (vld_color(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  abort_chk(x_name, " must be a valid color", call. = FALSE)
}

#' @describeIn chk_color Check Color String Object
#'
#' @description
#'
#' `chk_colour`
#' checks if a color string.
#'
#' @export
#'
#' @examples
#'
#' # chk_colour
#' chk_colour("blue")
#' try(chk_colour("glue"))
chk_colour <- function(x, x_name = NULL) {
  if (vld_colour(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  abort_chk(x_name, " must be a valid color", call. = FALSE)
}
