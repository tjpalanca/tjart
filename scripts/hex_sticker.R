library(hexSticker)
library(usethis)
library(magrittr)

logo_location <- "inst/img/logo.png"

sticker(
  subplot =
    png::readPNG("inst/img/tjlogo.png") %>%
    grid::rasterGrob(interpolate = TRUE),
  package  = "tjart",
  filename = logo_location,
  p_size   = 20,
  s_width  = 10,
  s_height = 0.9,
  s_x      = 1,
  p_color  = "black",
  h_color  = "black",
  h_fill   = "#FAFAFA"
)

file.remove("man/figures/logo.png")
use_logo(logo_location)
