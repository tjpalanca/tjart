#' @title
#' Honeycomb
#'
#' @description
#' A hexmap with randomly flashing hexes
#'
#' @param hex_size scale of the hexes. Default is 50.
#' @param hex_stroke_width width of the stroke dividing the hexes
#' @param flash_color hex color of the flashing hexes
#' @param basis_color basic color of the unflashing hexes
#' @param flash_duration_secs seconds duration of the flashing
#' @param flash_interval_secs seconds interval of each trigger
#' @param ... passed to [`r2d3::r2d3()`]
#' @param sizing sizing policy according to [`htmlwidgets::sizingPolicy()`]
#'
#' @export
honeycomb <- function(hex_size = 50L,
                      hex_stroke_width = 6L,
                      flash_color = "#008080",
                      basis_color = "#DCDCDC",
                      flash_duration_secs = 6L,
                      flash_interval_secs = 1L,
                      ...,
                      sizing = htmlwidgets::sizingPolicy(padding = 0)) {
  r2d3::r2d3(
    data    = NULL,
    script  = system.file("honeycomb/honeycomb.js", package = "tjart"),
    options = list(
      hex_size = hex_size,
      hex_stroke_width = hex_stroke_width,
      flash_color = flash_color,
      basis_color = basis_color,
      flash_duration_secs = flash_duration_secs,
      flash_interval_secs = flash_interval_secs
    ),
    ...,
    sizing = sizing
  )
}
