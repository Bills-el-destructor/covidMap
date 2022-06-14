library(leaflet)
library(sf)
library(rgdal)

provincias = st_read("PUNO/PROVINCIAS_PUNO.shp") #%>% as_Spatial()
CASOS = c(11,22,33,44,55,66,77,88,99,100,110,120,130)
provincias = cbind(provincias, CASOS)
provincias = provincias %>% as_Spatial()

bins <- c(10, 50, 100, 150)
#pal <- colorBin("YlOrRd", domain = provincias$CASOS, bins = bins)
pal <- colorNumeric(c("black", "red"), 1:10, domain = provincias$CASOS)

m = leaflet() %>% 
  addProviderTiles("CartoDB.DarkMatter") %>% 
  addPolygons(data = provincias,
              fillColor = ~pal(provincias$CASOS),
              weight = 0.2,
              opacity = 1,
              color = "grey",
              smoothFactor = 0.5,
              fillOpacity = 0.8) %>% 
  addLegend(position = "bottomright", pal = pal, values = provincias$CASOS, opacity = 0.7, title = "CASOS")
m
