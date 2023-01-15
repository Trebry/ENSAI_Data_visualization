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


shinyUI(
  navbarPage(theme = shinytheme("flatly"), collapsible = TRUE,
             HTML('<a style="text-decoration:none;cursor:default;color:#FFFFFF;" class="active" href="#">Railroad Aid</a>'),
             id="nav",
             
             # Home page
             source(file = "ui_page1.R", local = T)$value,
             
             # Stations in France
             source(file = "ui_page2.R", local = T)$value,
             
             # Departures
             source(file = "ui_page3.R", local = T)$value,
             
             # Find your train
             source(file = "ui_page4.R", local = T)$value,
             
             # Lost and found
             source(file = "ui_page5.R", local = T)$value,
             
             # About this site
             source(file = "ui_page6.R", local = T)$value
  )
)
