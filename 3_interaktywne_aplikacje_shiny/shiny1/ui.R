library(shiny)
library(PogromcyDanych)

shinyUI(fluidPage(
  titlePanel("Eksplorator seriali"),
  p("Jakis napis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("serial",
                  "Wybierz serial",
                  levels(serialeIMDB$serial),
                  "Friends")
      ),
    
    mainPanel(
      p("Dane dotyczące wybranego serialu:"),
      br(),
      tableOutput("tabela")
    )
  )
))
