library(tidyverse)
library("tidytransit")

local_gtfs_path <- system.file( "export_gtfs_voyages.zip", 
                               package = "tidytransit")
schedule <- read_gtfs("./gtfs_tgv.zip","routes.txt")

gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")
summary(schedule)

head(gtfs$.$dates_services)

stop_ids <- gtfs$stops %>% filter(stop_name == "Rennes") %>%  select(stop_id)

departures <- stop_ids %>% 
  inner_join(gtfs$stop_times %>% 
               select(trip_id, arrival_time, 
                      departure_time, stop_id), 
             by = "stop_id")

departures <- departures %>% 
  left_join(gtfs$trips %>% 
              select(trip_id, route_id, 
                     service_id, trip_headsign), 
            by = "trip_id") 
departures <- departures %>% 
  left_join(gtfs$routes %>% 
              select(route_id, 
                     route_long_name), 
            by = "route_id")
departures %>% 
  select(arrival_time,
         departure_time,
         trip_headsign,
         route_id,route_long_name) %>%
  head() %>%
  knitr::kable()
