library(shiny)
library(shinydashboard)
library(sf)
library(leaflet)
library(rgdal)

provincias = st_read("PUNO/PROVINCIAS_PUNO.shp") #%>% as_Spatial()
CASOS = c(11,22,33,44,55,66,77,88,99,100,110,120,130)
provincias = cbind(provincias, CASOS)
provincias = provincias %>% as_Spatial()

bins <- c(10, 50, 100, 150)
#pal <- colorBin("YlOrRd", domain = provincias$CASOS, bins = bins)
pal <- colorNumeric(c("black", "green"), 1:10, domain = provincias$CASOS)

ui = dashboardPage(skin = "blue",
                   dashboardHeader(title = "Covid-19 2020-2021"),
                   dashboardSidebar(
                     sidebarMenu(
                       menuItem("Mapa Provincial", tabName = "Provincial", icon = icon("map")),
                       menuItem("Mapa Distrital", tabName = "Distrital"),
                       menuItem("Tasa R0 Provincial", tabName = "RProvincial"),
                       menuItem("Tasa R0 Distrital"),
                       menuItem("Casos", icon = icon("chart-area")),
                       menuItem("Curva SIR-D", icon = icon("chart-line")),
                       sliderInput(inputId = "num", label = "Dia", min = 1, max = 365, value = 1, animate = T)
                     )
                   ),
                   dashboardBody(
                     tabItems(
                       tabItem(tabName = "Provincial",
                               fluidRow(infoBox("Infectados", 128, icon = icon("thumbs-down")),
                                        infoBox("Recuperados", 118, icon = icon("thumbs-up")),
                                        infoBox("Fallecidos", 7, icon = icon("skull")),
                                        valueBox("Total", 1298, icon = icon("fair"))
                                        ),
                               fluidRow(
                                 box(width =12, leafletOutput(outputId = "mymap"))
                               )),
                       tabItem(tabName = "Distrital",
                               h1("Mapa Distrital")),
                       tabItem(tabName = "RProvincial",
                               h1("Tasa R0 Provincial"))
                     )
                   )
)

server = function(input, output) {
  
  output$mymap = renderLeaflet(
    leaflet() %>% 
      addProviderTiles("CartoDB.DarkMatter") %>% 
      addPolygons(data = provincias,
                  fillColor = ~pal(provincias$CASOS),
                  weight = 0.5,
                  opacity = 1,
                  color = "green",
                  fillOpacity = 0.8) %>% 
      addLegend(position = "bottomright", pal = pal, values = provincias$CASOS, opacity = 0.7, title = "CASOS")
  )
}

shinyApp(ui = ui, server = server)
