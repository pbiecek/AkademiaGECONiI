library(shiny)
library(PogromcyDanych)

shinyServer(function(input, output) {
  # tabela
  output$tabela <- renderTable({
    serialeIMDB[serialeIMDB$serial == input$serial, c("serial", "nazwa", "sezon", "ocena", "glosow")]
  })

  # wykres
  output$wykres <- renderPlot({
    tmp <- serialeIMDB[serialeIMDB$serial == input$serial,]
    ggplot(tmp, aes(x=id, y=ocena)) + geom_point() + geom_smooth(se=FALSE)
  })
  
  # podsumowanie
  output$podsumowanie <- renderPrint({
    tmp <- serialeIMDB[serialeIMDB$serial == input$serial, c("ocena", "glosow")]
    summary(tmp)
  })
  
})

