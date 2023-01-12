routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
output$priceTable <- renderDataTable({
  routeinfo %>% filter(`Gare origine`==input$fromLocation) %>% 
    filter(`Destination`==input$toLocation)%>%
    filter(`Classe`=="1")
  
})

