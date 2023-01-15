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

# Download data using API
#stations_raw <- read_delim("https://ressources.data.sncf.com/api/v2/catalog/datasets/referentiel-gares-voyageurs/exports/csv?limit=-1&offset=0&timezone=UTC",delim = ";", escape_double = FALSE, trim_ws = TRUE)
#horaires_gare <- read_delim("https://ressources.data.sncf.com/api/v2/catalog/datasets/horaires-des-gares1/exports/csv?limit=-1&offset=0&timezone=UTC",delim = ";", escape_double = FALSE, trim_ws = TRUE)
#routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
routeinfo <- read_delim("https://ressources.data.sncf.com/api/v2/catalog/datasets/tarifs-tgv-inoui-ouigo/exports/csv?limit=-1&offset=0&timezone=UTC",delim=";")
lost_found <- read_delim("https://ressources.data.sncf.com/api/v2/catalog/datasets/objets-trouves-restitution/exports/csv?order_by%3Ddate%20asc&limit=100&offset=0&timezone=UTC",delim = ";", escape_double = FALSE, trim_ws = TRUE)
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")

# Loading data that shouldn't change
stations_raw <- read_delim("mess/referentiel-gares-voyageurs.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
horaires_gare<- read_delim("mess/horaires-des-gares1.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)

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
  
  # Lost and found
  source(file = "app_page5.R", local = T)

  # About this site
  source(file = "app_page6.R", local = T)
  
})
