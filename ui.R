library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(
  # navbarPage
  navbarPage("Second app",
             # First tab Data
             source(file = "ui_page1.R", local = T)$value
             , 
             
             # Second tab Visualization
             source(file = "ui_page2.R", local = T)$value
  )
)
