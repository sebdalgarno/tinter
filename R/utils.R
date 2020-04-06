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
