library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  source(file = "app_page1.R", local = T)

  source(file = "app_page2.R", local = T)
  
})
