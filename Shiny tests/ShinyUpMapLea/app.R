library(shiny)
library(shinydashboard)
library(sf)
library(leaflet)
library(rgdal)
library(bslib) 
theme = bs_theme(bg = "#0b3d91", 
                  fg = "white", 
                  primary = "#FCC780", 
                  base_font = font_google("Space Mono"), 
                  code_font = font_google("Space Mono")) 


provincias = st_read("PUNO/PROVINCIAS_PUNO.shp") #%>% as_Spatial()
CASOS = c(11,22,33,44,55,66,77,88,99,100,110,120,130)
provincias = cbind(provincias, CASOS)
provincias = provincias %>% as_Spatial()

bins <- c(10, 50, 100, 150)
#pal <- colorBin("YlOrRd", domain = provincias$CASOS, bins = bins)
pal <- colorNumeric(c("black", "green"), 1:10, domain = provincias$CASOS)

ui = dashboardPage(skin = "blue",
                   dashboardHeader(title = "Covid-19 Puno"),
                   dashboardSidebar(
                     sidebarMenu(
                       menuItem("Mapa Provincial", tabName = "Provincial"),
                       menuItem("Mapa Distrital", tabName = "Distrital"),
                       menuItem("Tasa R0 Provincial", tabName = "RProvincial"),
                       menuItem("Tasa R0 Distrital"),
                       menuItem("Casos"),
                       menuItem("Curva SIR-D"),
                       sliderInput(inputId = "num", label = "Dia", min = 1, max = 365, value = 1, animate = T)
                     )
                   ),
                   dashboardBody(
                     tabItems(
                       tabItem(tabName = "Provincial",
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

