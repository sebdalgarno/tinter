shade <- function(x, steps, crop) {
  shade <- rev(grDevices::colorRampPalette(c(x, "black"))(steps + 1))
  if (crop == 0) {
    return(rev(shade))
  }
  rev(shade[-(seq_len(crop))])
}

tint <- function(x, steps, crop) {
  tint <- rev(grDevices::colorRampPalette(c(x, "white"))(steps + 1))
  if (crop == 0) {
    return(tint)
  }
  tint[-(seq_len(crop))]
}

check_colour <- function(x) {
  res <- try(grDevices::col2rgb(x), silent = TRUE)
  if (class(res) == "try-error") {
    stop(x, " is not a valid color", call. = FALSE)
  }
}
