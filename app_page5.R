#Lost and found
output$PiePlot <- renderPlot({
  ggplot(data = lost_found[lost_found$gc_obo_type_c %in% input$lost_col, ]
    , aes(x=factor(1), fill=gc_obo_type_c))+
    geom_bar(width = 1)+
    coord_polar("y")+
    theme(axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) +
    guides(fill=guide_legend(title="Lost items"))
})

output$DistPlot <- renderPlot({
  ggplot(data = lost_found[lost_found$gc_obo_type_c %in% input$lost_col, ]) +
    geom_bar(mapping = aes(x = gc_obo_type_c, fill = gc_obo_type_c)) + 
    coord_flip() +
    theme(axis.title.y=element_blank(),
          legend.position = "none")
})

output$lostTable <- renderDataTable(
  lost_found[lost_found$gc_obo_type_c %in% input$lost_col, ],
  options = list(pageLength = 8)
)
