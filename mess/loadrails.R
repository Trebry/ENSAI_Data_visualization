# libraries we need
libs <- c("tidyverse", "sf", "giscoR", "ggfx")

# install missing libraries
installed_libs <- libs %in% rownames(installed.packages())
if (any(installed_libs == F)) {
  install.packages(libs[!installed_libs])
}

# load libraries
invisible(lapply(libs, library, character.only = T))

# 1. Bulk download railway shapefiles
#------------------------------------

europeList <- function(urlfile, iso3DF) {
  
  urlfile <-'https://raw.githubusercontent.com/lukes/ISO-3166-Countries-with-Regional-Codes/master/all/all.csv'
  
  iso3DF <- read.csv(urlfile) %>%
    filter(name=="France") %>%
    select("alpha.3") %>%
    rename(iso3 = alpha.3)
  
  return(iso3DF)
}

iso3DF <- europeList()

# create a directory for railway SHPs
dir <- file.path(tempdir(), 'rail')
dir.create(dir)

downloadSHP <- function(urls) {
  
  # make URL for every country
  urls <- paste0("https://biogeo.ucdavis.edu/data/diva/rrd/", 
                 iso3DF$iso3, "_rrd.zip")
  
  # iterate and download
  lapply(urls, function(url) download.file(url, file.path(dir, basename(url))))
}

downloadSHP()

# 2. Unzip and load railway shapefiles
#-------------------------------------

unzipSHP <- function(urls) {
  filenames <- list.files(dir, full.names=T)
  lapply(filenames, unzip)
}

unzipSHP()


loadSHP <- function(SHPs, rails) {
  #create a list of railway shapefiles for import
  SHPs <- list.files(pattern="_rails.*\\.shp$")
  
  #Use lapply to import all shapefiles in the list
  rails <- lapply(SHPs, function(rail_shp) {
    rail <- st_read(rail_shp) %>%  #next, read all shp files as "sf" object and assign WSG84 projection
      st_transform(crs = 4326)
    return(rail)
  }) %>% 
    bind_rows() #finally, merge rail lines into single data.frame
  
  return(rails)
}

rails <- loadSHP()

library(leaflet)
map <- leaflet(data=rails) |>addTiles() |> addPolylines(color="red",weight=3,fill=NA)|> 
  addCircleMarkers(stations_raw$Longitude, stations_raw$Latitude,radius=1,color="black")
map
