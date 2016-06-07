######################################################
# Script to read state geojson and add data attribute
######################################################
library(rgdal)      # spatial data processing
library(jsonlite)   # read json files

# source: https://raw.githubusercontent.com/edwinsteele/d3-projects/master/data/au-states.geojson
gdal.states <- readOGR("maps/au-states.geojson", "OGRGeoJSON")

# have a look at the object
summary(gdal.states)
data.frame(gdal.states)

#TODO adjust to have a join on state names
# add vector of density values
density             <- c(94.65,54,32,42,41,64,1,19,1)
gdal.states$DENSITY <- density

# create moc data for states 9 elements to match geojson
# density <- c("NSW" = 94.65, 
#              "QLD"  = 54,
#              "VIC"  = 32,
#              "SA"   = 42,
#              "WA"   = 41,
#              "TAS"  = 64,
#              "NT"   = 1,
#              "ACT"  = 19,
#              "Other"= 1)

# write to a new file
writeOGR(gdal.states,'maps/au-states-density.geojson','spDf', driver='GeoJSON',check_exists = FALSE)