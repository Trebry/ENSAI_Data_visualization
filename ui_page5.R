# Lost and found
tabPanel("Lost items",
         sidebarLayout(
           sidebarPanel(
             # selection of the variable
             checkboxGroupInput(inputId = "lost_col", label = "Select the data you want to show :", 
                                choices = unique(lost_found$gc_obo_type_c), 
                                selected = unique(lost_found$gc_obo_type_c))
           ),
         mainPanel(
            tabsetPanel(
              tabPanel("Most common items lost (bar chart)", plotOutput("DistPlot")),
              tabPanel("Most common items lost (pie chart)", plotOutput("PiePlot")),
              tabPanel("Details on lost items", dataTableOutput("lostTable"))
            )
         )
    )
)
