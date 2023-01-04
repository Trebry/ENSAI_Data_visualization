# First tab Data
tabPanel("Data", 
         # table
         dataTableOutput("table"),
         # summary
         verbatimTextOutput("summary")
)