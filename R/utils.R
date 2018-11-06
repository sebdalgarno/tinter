shade <- function(x, steps, crop){
  shade <- rev(grDevices::colorRampPalette(c(x, "black"))(steps + 1))
  if(crop == 0){
    return(rev(shade))
  }
  rev(shade[-(seq_len(crop))])
}

tint <- function(x, steps, crop){
  tint <- rev(grDevices::colorRampPalette(c(x, "white"))(steps + 1))
  if(crop == 0){
    return(tint)
  }
  tint[-(seq_len(crop))]
}

check_steps <- function(x){
  attributes(x) <- NULL
  if (is.double(x) && identical(as.double(as.integer(x)), x))
    x <- as.integer(x)
  checkr::check_scalar(x, values = c(0L, checkr::chk_max_int()), x_name = "steps")
}

check_crop <- function(x){
  attributes(x) <- NULL
  if (is.double(x) && identical(as.double(as.integer(x)), x))
    x <- as.integer(x)
  checkr::check_scalar(x, values = c(0L, checkr::chk_max_int()), x_name = "crop")
}

check_colour <- function(x){
  res <- try(grDevices::col2rgb(x),silent = TRUE)
  if(class(res) == "try-error")
    stop(x, " is not a valid color", call. = FALSE)
}

check_direction <- function(x){
  checkr::check_vector(x, values = c("shades", "tints", "both"), x_name = "direction")
}

tinter_plot <- function(x){
  grid <- c(length(x), 1)
  width <- 0.9/(max(grid) + 1)
  gap <- 1/(max(grid) + 1)
  centres <- lapply(grid, function(i) gap * ((max(grid) -
                                                i)/2 + seq_len(i)))
  centres <- as.matrix(expand.grid(centres))
  oldPars <- graphics::par(mai = c(0, 0, 0, 0), bg = "white")
  on.exit(graphics::par(oldPars))
  devSize <- grDevices::dev.size()
  devRatio <- devSize[2]/devSize[1]
  graphics::plot(NA, NA, xlim = c(-0.1, 1.1), ylim = 0.5 + c(-1, 1) *
         devRatio * 0.6, xlab = "", ylab = "", xaxt = "n", yaxt = "n",
       bty = "n", asp = 1)
  graphics::rect(centres[, 1] - width/2, rev(centres[, 2]) - width/2,
       centres[, 1] + width/2, rev(centres[, 2]) + width/2,
       col = x, border = "black", lwd = 0.2)
}




