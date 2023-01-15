# Departures

# Tables used for the tab : Departures
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")

stop_ids <- gtfs$stops %>% select(stop_id,stop_name) 
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

output$table <- renderDataTable({
  departures %>% filter(stop_name == input$location) %>% 
    select(stop_name,date,
           arrival_time,
           departure_time,
           trip_headsign,
           route_long_name) %>%
    arrange(date,arrival_time)
})

output$subtitle<- renderText({ paste("Departures from",input$location,"on date:",Sys.Date(),"\n") })

