library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinythemes)
library(colourpicker)
library(leaflet)
library(sf)
library(ggmap)
library(tidyverse)
library(geojsonR)
library(tidytransit)

# Download the data used in the project
stations_raw <- read_delim("mess/referentiel-gares-voyageurs.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
horaires_gare<- read_delim("mess/horaires-des-gares1.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Home page
  source(file = "app_page1.R", local = T)

  # Stations in France
  source(file = "app_page2.R", local = T)
  
  # Departures
  source(file = "app_page3.R", local = T)
  
  # Find your train
  source(file = "app_page4.R", local = T)

  # About this site
  source(file = "app_page5.R", local = T)
  
})
