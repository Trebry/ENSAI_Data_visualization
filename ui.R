library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinythemes)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(
  # navbarPage
  
  navbarPage(theme = shinytheme("flatly"), collapsible = TRUE,
             HTML('<a style="text-decoration:none;cursor:default;color:#FFFFFF;" class="active" href="#">Second app</a>'),
             id="nav",

             # Home page
             source(file = "ui_page1.R", local = T)$value,
             
             # First map
             source(file = "ui_page2.R", local = T)$value,
             
             # First graph
             source(file = "ui_page3.R", local = T)$value,
             
             # Second graph
             source(file = "ui_page4.R", local = T)$value,
             
             #About
             source(file = "ui_page5.R", local = T)$value
  )
)
