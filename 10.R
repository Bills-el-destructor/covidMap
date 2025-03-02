library(sf)
library(raster)
library(dplyr)
library(spData)
library(tmap)
library(leaflet)
library(ggplot2)

myshp = st_read("PUNO/DISTRITOS_PUNO.shp")

tm_shape(myshp) + tm_polygons()

MD =  tm_shape(myshp) +
      tmap_options(inner.margins = c(0.1, 0.1, 0.02, 0.01)) +
      tm_fill('PROVINCIA', #tm_fill = rellena de colores el mapa y la paleta
              title = '',
              palette = c("white", "red"), # "OrRd" "Blues" "Greys" "RdYlGn" c("red", "white")
              style = 'quantile') +
      tm_layout(frame = T, frame.double.line = T,
      main.title = 'Mapa Covid 19 Puno 2020 - 2021', #main.title = Todo respecto al titutlo general
              main.title.size = 1,
              fontface = 2,
              fontfamily = 'Times New Roman',
              main.title.position = c(0.12, 0.5)) +
      tm_borders(col = "black", lwd = 1, lty = "solid", alpha = 0.25) +
      #tm_text('DISTRITO', size = 0.4, fontface = 2, fontfamily = 'Tw Cen MT Condensed') + #tm_text = nombres de los distritos
      #tm_shape(myshp) +
      #tm_text("IDDIST", size = 0.4, fontface = 2, fontfamily = 'Tw Cen MT Condensed', auto.placement = 0.05) +
      tm_compass(type = "8star", position = c(0.7, 0.35)) +
      tm_credits("Autor: Bill", fontface = "italic", align = "right")

  