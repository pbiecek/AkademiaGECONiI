library(shiny)
library(PogromcyDanych)

shinyServer(function(input, output) {
  output$tabela <- renderTable({
    
    serialeIMDB[serialeIMDB$serial == input$serial,]

  })
})

