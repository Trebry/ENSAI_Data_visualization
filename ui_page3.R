# Departures

# Tables used for the tab : Departures
gtfs <- read_gtfs("https://eu.ftp.opendatasoft.com/sncf/gtfs/export_gtfs_voyages.zip")

tabPanel("Departures",
         selectInput(inputId="location",label="Select a location",
                      choices=gtfs$stops %>% select(stop_name) %>% arrange(stop_name)
         ),
         # table
         dataTableOutput("table")
         )