# Find your train
routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
output$priceTable <- renderDataTable({
  routeinfo %>% filter(`Gare origine`==input$fromLocation) %>% 
    filter(`Classe`==input$class)
  
})

output$distPlot <- renderPlot({
  
  # generate bins based on input$bins from ui.R
  x    <-   routeinfo %>% filter(`Gare origine`== (if (input$fromLocation=="") "RENNES" else input$fromLocation)) %>% 
    filter(`Classe`==input$class) %>% pull( (if (input$price=="minimum") `Prix minimum` else `Prix maximum`))
  
  bins <- seq(min(x), max(x), length.out = input$bins + 1)
  
  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = input$color, border = 'white',
       xlab = '',
       main = input$title)
  
})

