library(pins)
library(sf)

board_register_github(repo = "tjpalanca/pins", branch = "master")

# Get the Philippines Shapefile
pin(
  I(readRDS(url(
    "https://biogeo.ucdavis.edu/data/gadm3.6/Rsf/gadm36_PHL_0_sf.rds"
  ))),
  name = "gadm_philippines_0_sf",
  description = "Philippines Map from the GADM Database, Level 0"
)
