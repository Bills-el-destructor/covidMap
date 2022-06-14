library(shiny)
ui <- shinyUI(
  fluidPage(
    fluidRow(
      column(6,
             plotOutput(outputId = "hist1")
      ),
      column(6,
             plotOutput(outputId = "hist2")
      )
    ),
    fluidRow(
      column(6,
             plotOutput(outputId = "hist3")
      ),
      column(6,
             plotOutput(outputId = "hist4")
      )
    )
  )
)

server <- function(input,output){
  output$hist1 <- renderPlot({
    hist(rnorm(100,50,5))
  })
  output$hist2 <- renderPlot({
    hist(rnorm(100,75,5))
  })
  output$hist3 <- renderPlot({
    hist(rnorm(100,100,5))
  })
  output$hist4 <- renderPlot({
    hist(rnorm(100,125,5))
  })
}
shinyApp(ui, server)
