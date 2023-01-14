# Find your train
routeinfo <- read_delim("./mess/tarifs-tgv-inoui-ouigo.csv",delim=";")
tabPanel("Visualization", 
         
         # Sidebar with a slider input for number of bins 
         sidebarLayout(
           sidebarPanel(
             selectInput(inputId="fromLocation",label="Select a departure station",
                         choices=routeinfo %>% select(`Gare origine`) %>% arrange(`Gare origine`)
             ),
             selectInput(inputId="toLocation",label="Select a destination location",
                         choices=routeinfo %>% select(`Destination`) %>% arrange(`Destination`)
             ),
             
             # selection of the variable
             radioButtons(inputId = "class", label = "Class : ", choices = c("1","2"),selected="1")
           ),
           
           # Show a plot of the generated distribution
           mainPanel(
             dataTableOutput("priceTable"),
             # classes (div centrée)
           )
         )
)
