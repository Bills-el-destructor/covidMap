library(shiny)

ui = fluidPage(
  sliderInput(inputId = "num", label = "Escoge un numero", 
              value = 1, min = 1, 
              max = 365),
  plotOutput("histograma", "more")
)

server = function(input, output){
  output$histograma = renderPlot({
    hist(rnorm(input$num))
  })
  output$more = renderPlot({
    hist(rnorm(input$num * 2))
  })
}

shinyApp(ui = ui, server = server)