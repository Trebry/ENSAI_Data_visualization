# Stations in France

# Tables used for the tab : Stations in France
horaires_gare <- horaires_gare %>%
  pivot_wider(names_from = 'Jour de la semaine', values_from = 'Horaire en jour normal', values_fn = list)
horaires_gare <- replace_na(horaires_gare, replace=list(rep("Not available", ncol(horaires_gare))))

stations_raw <- stations_raw %>% 
  left_join(horaires_gare,
            by = c('Code UIC'='UIC')) 

# Create map showing the various stations in France
output$map <- renderLeaflet({
  leaflet(data=stations_raw) %>%
    setView(lng = 2.2137, lat = 46.2276, zoom = 6) |>  addTiles() |> 
    addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '3',], 
                     ~Longitude, ~Latitude, icon = awesomeIcons(
                       icon = 'info-sign',
                       markerColor = 'green'
                     ), 
                     clusterOptions = markerClusterOptions(),
                     popup=~paste("<b>",`Intitulé plateforme`,
                                  `Code postal`,
                                  "<br>Horiaires d'ouverture : </b>",
                                  "<br>Monday ;", `Lundi`,
                                  "<br>Tuesday :", `Mardi`, 
                                  "<br>Wednesday :", `Mercredi`, 
                                  "<br>Thursday :", `Jeudi`, 
                                  "<br>Friday :", `Vendredi`, 
                                  "<br>Saturday :", `Samedi`,
                                  "<br>Sunday :", `Dimanche`)) |> 
    addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '2',], 
                   ~Longitude, ~Latitude, icon = awesomeIcons(
                     icon = 'info-sign',
                     markerColor = 'orange'
                   ), 
                   clusterOptions = markerClusterOptions(),
                   popup=~paste("<b>",`Intitulé plateforme`,
                                `Code postal`,
                                "<br>Horiaires d'ouverture : </b>",
                                "<br>Monday ;", `Lundi`,
                                "<br>Tuesday :", `Mardi`, 
                                "<br>Wednesday :", `Mercredi`, 
                                "<br>Thursday :", `Jeudi`, 
                                "<br>Friday :", `Vendredi`, 
                                "<br>Saturday :", `Samedi`,
                                "<br>Sunday :", `Dimanche`)) |> 
    addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '1',], 
                   ~Longitude, ~Latitude, icon = awesomeIcons(
                     icon = 'info-sign',
                     markerColor = 'red'
                   ),  
                   clusterOptions = markerClusterOptions(),
                   popup=~paste("<b>",`Intitulé plateforme`,
                                `Code postal`,"</b>"))
})

# Get the address searched by the user
output$value <- renderText({ input$adresse })

# Find the coordinates of the searched address
observeEvent(input$Getadresse, {
  # Convert address for API lookup
  search = str_replace_all(input$adresse, " ", "+")
  search = str_to_lower(search)
  file_js = FROM_GeoJson(url_file_string = paste("https://api-adresse.data.gouv.fr/search/?q=",search, sep = ''))
  # Extract coordinates
  output$adresselng <- renderText({ paste("Longitude :",file_js$features[[1]]$geometry$coordinates[1])})
  output$adresselat <- renderText({ paste("Latitude :",file_js$features[[1]]$geometry$coordinates[2])})
  stations_raw$distance <- sqrt((file_js$features[[1]]$geometry$coordinates[1] - stations_raw$Longitude )^2 + 
                                (file_js$features[[1]]$geometry$coordinates[2] - stations_raw$Latitude )^2)
  # Find nearest station
  min_index = which.min(stations_raw$distance)
  output$station <- renderText({ paste("The closest station to you is at :",stations_raw$Commune[min_index])})

  # Render map centered on found station
  output$map <- renderLeaflet({
    leaflet(data=stations_raw) %>%
      setView(lng = stations_raw$Longitude[min_index], lat = stations_raw$Latitude[min_index], zoom = 12) |>  addTiles() |> 
      addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '3',], 
                        ~Longitude, ~Latitude, icon = awesomeIcons(
                          icon = 'info-sign',
                          markerColor = 'green'
                        ), 
                        clusterOptions = markerClusterOptions(),
                        popup=~paste(`Intitulé plateforme`,
                                     `Code postal`,
                                     "<br>Horiaires d'ouverture : ",
                                     "<br>Monday ;", `Lundi`,
                                     "<br>Tuesday :", `Mardi`, 
                                     "<br>Wednesday :", `Mercredi`, 
                                     "<br>Thursday :", `Jeudi`, 
                                     "<br>Friday :", `Vendredi`, 
                                     "<br>Saturday :", `Samedi`,
                                     "<br>Sunday :", `Dimanche`)) |> 
      addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '2',], 
                        ~Longitude, ~Latitude, icon = awesomeIcons(
                          icon = 'info-sign',
                          markerColor = 'orange'
                        ), 
                        clusterOptions = markerClusterOptions(),
                        popup=~paste(`Intitulé plateforme`,
                                     `Code postal`,
                                     "<br>Horiaires d'ouverture : ",
                                     "<br>Monday ;", `Lundi`,
                                     "<br>Tuesday :", `Mardi`, 
                                     "<br>Wednesday :", `Mercredi`, 
                                     "<br>Thursday :", `Jeudi`, 
                                     "<br>Friday :", `Vendredi`, 
                                     "<br>Saturday :", `Samedi`,
                                     "<br>Sunday :", `Dimanche`)) |> 
      addAwesomeMarkers(data = stations_raw[stations_raw$`Niveau de service` == '1',], 
                        ~Longitude, ~Latitude, icon = awesomeIcons(
                          icon = 'info-sign',
                          markerColor = 'red'
                        ),  
                        clusterOptions = markerClusterOptions(),
                        popup=~paste(`Intitulé plateforme`,
                                     `Code postal`))
  })
  }
)