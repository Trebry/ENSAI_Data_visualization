output$map <- renderLeaflet({
  leaflet() %>%
    setView(lng = 2.2137, lat = 46.2276, zoom = 6) |>  addTiles()
    #%>%
    #addMarkers(data = points())
})