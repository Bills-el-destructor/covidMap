library(shiny)
library(shinydashboard)
library(tidyverse)

source("../grafica de casos Infectados recuperados y decesos.R", chdir = TRUE)

ui = dashboardPage(title= "Dashboard", skin= "green",
                  dashboardHeader(title="PROYECTO"),
                  dashboardSidebar(
                    sidebarMenu(id="sidebarID",
                                menuItem("Primera ventana"),
                                menuSubItem("Primera sub-ventana"),
                                menuItem("Segunda ventana",id = "chartsID",
                                         menuSubItem("Sub-ventana1", tabName = "montos", icon = shiny::icon("eye")),
                                         menuSubItem("Sub-ventana2"),
                                         menuSubItem("Sub-ventana3",icon =icon("apple-pay"))
                                )
                    )
                    
                    
                  ),
                  dashboardBody(
                    
                    tabItem(tabName = "montos", 
                            plotOutput("montos"))
                    
                    )
)

server <- function(input, output) { 
  
  output$montos<-renderPlot({montos})
}

shinyApp(ui = ui, server = server)
