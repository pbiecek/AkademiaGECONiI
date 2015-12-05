library(shiny)
library(PogromcyDanych)

# wykonywane raz gdy uruchamiana jest plikacja
serialeIMDB$sezon <- paste(serialeIMDB$sezon, serialeIMDB$odcinek, sep="/")

shinyServer(function(input, output) {
  # reużywalny fragment  
  dane <- reactive({
    serialeIMDB[serialeIMDB$serial == input$serial, 
                c("id", "serial", "nazwa", "sezon", "ocena", "glosow")]
  })

  # odpowiedź na kontrolki  
  output$tabela <- renderTable({
    dane()
  })

  output$wykres <- renderPlot({
    tmp <- dane()
    ggplot(tmp, aes(x=id, y=ocena)) + 
      geom_point() + 
      geom_smooth(se=FALSE, span=input$suwak, method="loess")
  })
  
  output$podsumowanie <- renderPrint({
    tmp <- dane()
    summary(tmp[,c("ocena", "glosow")])
  })
  
})

