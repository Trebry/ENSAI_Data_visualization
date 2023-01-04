library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Home page
  source(file = "app_page1.R", local = T)

  # First map
  source(file = "app_page2.R", local = T)
  
  # First graph
  source(file = "app_page3.R", local = T)
  
  # Second graph
  source(file = "app_page4.R", local = T)

  #About
  source(file = "app_page5.R", local = T)
  
})
