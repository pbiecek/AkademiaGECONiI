library(shiny)
library(PogromcyDanych)

shinyUI(fluidPage(
  titlePanel("Eksplorator seriali"),
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
      tabsetPanel(
        tabPanel("Wykres", plotOutput("wykres", width = 500)),
        tabPanel("Podsumowanie", verbatimTextOutput("podsumowanie")),
        tabPanel("Tabela", tableOutput("tabela"))
      )
    )
  )
))
