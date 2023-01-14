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

stations_raw <- read_delim("mess/referentiel-gares-voyageurs.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
horaires_gare<- read_delim("mess/horaires-des-gares1.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")


shinyUI(
  navbarPage(theme = shinytheme("flatly"), collapsible = TRUE,
             HTML('<a style="text-decoration:none;cursor:default;color:#FFFFFF;" class="active" href="#">Magnificent app</a>'),
             id="nav",
             
             # Home page
             source(file = "ui_page1.R", local = T)$value,
             
             # Stations in France
             source(file = "ui_page2.R", local = T)$value,
             
             # Departures
             source(file = "ui_page3.R", local = T)$value,
             
             # Find your train
             source(file = "ui_page4.R", local = T)$value,
             
             # About this site
             source(file = "ui_page5.R", local = T)$value
  )
)
