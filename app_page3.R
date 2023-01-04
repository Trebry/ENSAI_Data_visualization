# table
output$table <- renderDataTable({
  faithful
})

# summary
output$summary <- renderPrint({
  summary(faithful)
})