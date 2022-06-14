library(shiny)
library(shinydashboard)
library(tmap)

ui = dashboardPage(skin = "midnight",
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
                box(plotOutput("MD"))
              )),
      tabItem(tabName = "Distrital",
              h1("Mapa Distrital")),
      tabItem(tabName = "RProvincial",
              h1("Tasa R0 Provincial"))
    )
  )
)

server = function(input, output, session) {
  
  output$montos = renderPlot({montos})
}

shinyApp(ui, server)
