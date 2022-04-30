library(sf)
library(raster)
library(dplyr)
library(spData)
library(tmap)
library(leaflet)
library(ggplot2)
library(tmap)
library(sf)
library(extrafont)

myshp = st_read("PUNO/PROVINCIAS_PUNO.shp")

tmap_options(bg.color = "black", attr.color = "grey")
tm_shape(myshp) + tm_polygons()

M = tm_shape(myshp) +
  tmap_options(inner.margins = c(0.1, 0.1, 0.02, 0.01)) +
  tm_fill('PROVINCIA', #tm_fill = rellena de colores el mapa y la paleta
          title = '',
          palette = c("white", "red"), # "OrRd" "Blues" "Greys" "RdYlGn" c("red", "white")
          style = 'quantile') +
  tm_layout(frame = T, #frame.double.line = T,
            main.title = 'Mapa Covid 19 Puno 2020 - 2021', #main.title = Todo respecto al titutlo general
            main.title.size = 1,
            fontface = 2,
            fontfamily = 'Times New Roman',
            main.title.position = c(0.12, 0.5)) +
  tm_borders(col = "black", lwd = 1, lty = "solid", alpha = 0.25) +
  tm_text('PROVINCIA', size = 0.5, fontface = 2, fontfamily = 'Tw Cen MT Condensed') + #tm_text = nombres de los distritos
  #tm_shape(myshp) +
  #tm_text("IDDIST", size = 0.4, fontface = 2, fontfamily = 'Tw Cen MT Condensed', auto.placement = 0.05) +
  tm_credits("Autor: Bill", fontface = "italic", align = "right")

tmap_save(M, filename = "imagenes/mapa_provincial.jpg", width = 1080, height = 1920, units = "px", dpi = 250)
