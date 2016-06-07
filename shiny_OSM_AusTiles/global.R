library(shiny)      # web framework
library(leaflet)    # map interactivity
library(rgdal)      # spatial data processing
library(jsonlite)   # read json files

# read geojson
gdal.states <- readOGR("maps/au-states-density.geojson", "OGRGeoJSON")

# cloropleth aesthetics
colors <- c("#FFEDA0", "#FED976", "#FEB24C", "#FD8D3C", "#FC4E2A", "#E31A1C",  "#BD0026", "#800026")
bins   <- c(-Inf, 10, 20, 50, 100, 200, 500, 1000, Inf) + 0.00000001
pal    <- colorBin(colors, NULL, bins)