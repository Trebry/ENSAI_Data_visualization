#Create figures -> Map
rm(list=ls())

library(sf)
library(ggmap)
library(tidyverse)
library(leaflet)

stations_raw <- read_delim("referentiel-gares-voyageurs.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
m2 <- leaflet(data=stations_raw) |>addTiles() |> 
  addCircleMarkers(~Longitude, ~Latitude,radius=1,color="black",
                    popup=~paste(`Intitulé plateforme`,`Code postal` ))
m2

map <- leaflet(data=rails) |>addTiles() |> addPolylines(color="red",weight=3,fill=NA)|> 
  addCircleMarkers(stations_raw$Longitude, stations_raw$Latitude,radius=1,color="black")
map

rates <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
x<- rates %>% filter(`Gare origine`=="RENNES") %>% 
  filter(`Classe`=="1") %>% pull(`Prix maximum`)
rates %>% pull(`Gare origine`) 
