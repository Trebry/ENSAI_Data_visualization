# Find your train
output$priceTable <- renderDataTable({
  routeinfo %>% filter(`origine`==input$fromLocation) %>% 
    filter(`classe`==input$class)
  
})

output$distPlot <- renderPlot({
  
  # generate bins based on input$bins from ui.R
  x    <-   routeinfo %>% filter(`origine`== (if (input$fromLocation=="") "RENNES" else input$fromLocation)) %>% 
    filter(`classe`==input$class) %>% pull( (if (input$price=="minimum") `prix_min` else `prix_max`))
  
  bins <- seq(min(x), max(x), length.out = input$bins + 1)
  
  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = input$color, border = 'white',
       xlab = '',
       main = paste("Histogram of",input$price,"ticket prices from",input$fromLocation,"in class",input$class))
  
})

