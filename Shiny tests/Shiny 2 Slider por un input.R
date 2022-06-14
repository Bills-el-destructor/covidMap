library(shiny)

ui = fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num", label = "Dia", min = 1, max = 365, value = 1, animate = T)
    ),
    mainPanel(
      fluidRow(
        column(6, tableOutput(outputId = "tabla1")),
        column(6, tableOutput(outputId = "tabla2"))
      )
    )
  )
)

server = function(input, output, session) {
  output$tabla1 = renderTable({
    table(mtcars$mpg * input$num)
  })
  output$tabla2 = renderTable({
    table(mtcars$wt + input$num)
  })
}

shinyApp(ui, server)
