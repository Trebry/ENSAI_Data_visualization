output$map <- renderLeaflet({
  leaflet(data=stations_raw) %>%
    setView(lng = 2.2137, lat = 46.2276, zoom = 6) |>  addTiles() |> 
    #addMarkers(~Longitude, ~Latitude, popup=~paste(`Intitulé plateforme`,`Code postal` ))
    addCircleMarkers(~Longitude, ~Latitude,radius=1,color="black", popup=~paste(`Intitulé plateforme`,`Code postal` ))
})

output$value <- renderText({ input$adresse })

observeEvent(input$Getadresse, {
  search = str_replace_all(input$adresse, " ", "+")
  search = str_to_lower(search)
  file_js = FROM_GeoJson(url_file_string = paste("https://api-adresse.data.gouv.fr/search/?q=",search, sep = ''))
  output$adresselng <- renderText({ paste("Longitude :",file_js$features[[1]]$geometry$coordinates[1])})
  output$adresselat <- renderText({ paste("Latitude :",file_js$features[[1]]$geometry$coordinates[2])})
  stations_raw$distance <- sqrt((file_js$features[[1]]$geometry$coordinates[1] - stations_raw$Longitude )^2 + 
                                (file_js$features[[1]]$geometry$coordinates[2] - stations_raw$Latitude )^2)
  min_index = which.min(stations_raw$distance)
  output$station <- renderText({ paste("The closest station to you is at :",stations_raw$Commune[min_index])})
  
  output$map <- renderLeaflet({
    leaflet(data=stations_raw) %>%
      setView(lng = stations_raw$Longitude[min_index], lat = stations_raw$Latitude[min_index], zoom = 12) |>  addTiles() |> 
      addMarkers(stations_raw$Longitude[min_index], stations_raw$Latitude[min_index], popup=~paste(stations_raw$`Intitulé fronton de gare`[min_index])) |>
      addCircleMarkers(~Longitude, ~Latitude,radius=1,color="black", popup=~paste(`Intitulé plateforme`,`Code postal` ))
  })
  
  }
)