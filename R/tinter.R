#' Generate shades, tints or both from a colour.
#'
#' @param x A string of a colour in any format accepted by grDevices::col2rgb().
#' @param steps An integer indicating how many shades/tints to generate (excluding x).
#' @param crop An integer indicating how many extreme colours to remove (e.g. crop = 1 eliminates 'black' and 'white').
#' @param direction A string indicating whether to include 'tints', 'shades' or 'both'.
#' @param adjust A number between -1 and 1. A value below 0 will darken output; a value above 0 will lighten output.
#'
#' @return A vector of colours.
#' @export
#' @examples
#' tinter("blue")
#' tinter("#fa6a5c", steps = 10, crop = 3)
#' tinter("#fa6a5c", direction = "tints")

tinter <- function(x, steps = 5, crop = 1, direction = "both", adjust = 0){

  check_colour(x)
  check_length(x, length = 1L)
  steps <- check_noneg_int(steps, coerce = TRUE)
  crop <- check_noneg_int(crop, coerce = TRUE)
  check_vector(direction, values = c("shades", "tints", "both"))
  check_vector(adjust, c(-1, 1))

  if(crop > steps)
    stop("crop cannot be greater than steps.", call. = FALSE)

  shades <- shade(x, steps, crop)
  tints <- tint(x, steps, crop)

  res <- c(tints, shades[-1])

  if(direction == "shades"){
    res <- shades
  }
  if(direction == "tints"){
    res <- tints
  }

  if(adjust == 0){
    return(res)
  }
  if(adjust > 0){
    return(lighten(res, 1 - adjust))
  }
  darken(res, abs(adjust))
}

#' Darken colour.
#'
#' @param x A vector of strings of colours in any format accepted by grDevices::col2rgb().
#' @param amount A number from 0 to 1.
#'
#' @return A vector of modified colours.
#' @export
#' @examples
#' darken(tinter("blue"), 0.2)

darken <- function(x, amount){
  lapply(x, check_colour)
  check_vector(amount, values = c(0, 1))
  sapply(x, function(x){shade(x, 100, 0)[amount*100]}, USE.NAMES = FALSE)
}

#' Lighten colour.
#'
#' @param x A vector of strings of colours in any format accepted by grDevices::col2rgb().
#' @param amount A number from 0 to 1.
#'
#' @return A vector of modified colours.
#' @export
#' @examples
#' lighten(tinter("blue"), 0.2)

lighten <- function(x, amount){
  lapply(x, check_colour)
  check_vector(amount, values = c(0, 1))

  if(amount == 0){
    amount <- 0.01
  }
  sapply(x, function(x){tint(x, 100, 0)[amount*100]}, USE.NAMES = FALSE)
}
