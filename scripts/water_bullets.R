library(pins)
library(sf)
library(purrr)
library(magrittr)
library(dplyr)
library(ggplot2)

board_register_github(repo = "tjpalanca/pins", branch = "master")

philippines.sf <-
  pin_get("gadm_philippines_0_sf", board = "github") %>%
  st_simplify(dTolerance = 0.01)
ibtracs_wp.sf <-
  pin_get("ibtracs_wp_lines_shp_sf", board = "github")

