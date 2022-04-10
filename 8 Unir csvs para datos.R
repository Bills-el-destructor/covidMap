library(leaflet)
library(sp)

nombres = read.csv("nombres.csv")
latitud = read.csv("latitud.csv")
longitud = read.csv("longitud.csv")

data = data.frame(
  "nombres" = nombres,
  "latitud" = latitud,
  "longitud" = longitud
)
data$latitud = as.numeric(data$latitud)
data$longitud = as.numeric(data$longitud)

# data.SP = SpatialPointsDataFrame(data[,c(2,3)], data[,-c(2,3)])

xy = data[,c(2,3)]
fish = SpatialPointsDataFrame(coords = xy, data = data)

m = leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data = fish, 
                   lat = ~latitud, 
                   lng = ~longitud, 
                   popup = ~nombres, 
                   label = ~nombres)

m
