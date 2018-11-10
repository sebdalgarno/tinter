#' Generate shades, tints or both from a colour.
#'
#' @param x A string of a colour in any format accepted by grDevices::col2rgb().
#' @param steps An integer indicating how many shades/tints to generate (excluding x).
#' @param crop An integer indicating how many extreme colours to remove (e.g. crop = 1 eliminates 'black' and 'white').
#' @param direction A string indicating whether to include 'tints', 'shades' or 'both'.
#'
#' @return A vector of colours.
#'
#' @export
tinter <- function(x, steps = 5, crop = 1, direction = "both"){

  check_colour(x)
  steps <- check_noneg_int(steps, coerce = TRUE)
  crop <- check_noneg_int(crop, coerce = TRUE)
  check_vector(direction, values = c("shades", "tints", "both"))

  if(crop > steps)
    stop("crop cannot be greater than steps.", call. = FALSE)

  shades <- shade(x, steps, crop)
  tints <- tint(x, steps, crop)

  if(direction == "shades"){
    return(shades)
  }
  if(direction == "tints"){
    return(tints)
  }
  c(tints, shades[-1])
}
