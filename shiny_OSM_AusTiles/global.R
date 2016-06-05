library(shiny)      # web framework
library(leaflet)    # map interactivity
library(rgdal)      # spatial data processing
library(jsonlite)   # read json files

# source: https://raw.githubusercontent.com/edwinsteele/d3-projects/master/data/au-states.geojson
gdal.states <- readOGR("maps/au-states.geojson", "OGRGeoJSON")

# create moc data for states 9 elements to match geojson
density <- c("NSW" = 94.65, 
            "QLD"  = 54,
            "VIC"  = 32,
            "SA"   = 42,
            "WA"   = 41,
            "TAS"  = 64,
            "NT"   = 1,
            "ACT"  = 19,
            "Other"= 1)

# cloropleth aesthetics
colors <- c("#FFEDA0", "#FED976", "#FEB24C", "#FD8D3C", "#FC4E2A", "#E31A1C",  "#BD0026", "#800026")
bins   <- c(-Inf, 10, 20, 50, 100, 200, 500, 1000, Inf) + 0.00000001
pal    <- colorBin(colors, NULL, bins)