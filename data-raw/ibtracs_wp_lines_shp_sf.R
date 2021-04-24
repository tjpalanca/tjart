library(pins)
library(sf)
library(withr)

board_register_github(repo = "tjpalanca/pins", branch = "master")

# Get the IBTrACS tracks for the western pacific
pin_get("ibtracs_wp_lines_shp_sf", board = "github") %>% {
  tmp <- local_tempdir()
  unzip(., exdir = tmp)
  st_read(file.path(tmp, "IBTrACS.WP.list.v04r00.lines.shp"))
} %>%
  I() %>%
  pin(
    name = "ibtracs_wp_lines_shp_sf",
    description = "Best Track Archive for Western Pacific (SF)",
    board = "github"
  )
