library(tidyverse)
library("tidytransit")
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")


stop_ids <- gtfs$stops %>% select(stop_id,stop_name) #filter(stop_name == "Rennes") %>%  
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
                     route_long_name,route_desc), 
            by = "route_id")
departures <- departures %>% 
  left_join(gtfs$calendar_date %>% 
              select(service_id, 
                     date), 
            by = "service_id")



departures %>% filter(stop_name == "Rennes") %>% 
  select(stop_name,date,
         arrival_time,
         departure_time,
         trip_headsign,
         route_long_name) %>%
  arrange(date,arrival_time)



departures%>% select(stop_id)

departures<-departures %>% separate(stop_id, c("first", "UIC"), sep = "-") %>% select(-first)



test<-departures%>% select(arrival_time)
test<-test[1,]
test

Sys.timezone(location = TRUE)
Sys.time()
Sys.Date()

routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
routeinfo %>% filter(`Gare origine`=="RENNES") %>% 
  filter(`Destination`=="SAVERNE")%>%
  filter(`Classe`=="1")

