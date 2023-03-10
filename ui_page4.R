# Find your train
tabPanel("Prices", 
         
         # Sidebar with a slider input for number of bins 
         sidebarLayout(
           sidebarPanel(
             selectInput(inputId="fromLocation",label="Select a departure station",
                         choices=routeinfo %>% pull(`origine`),selected=NULL
             ),
             
             # selection of the variable
             radioButtons(inputId = "class", label = "Class : ", choices = c("1","2"),selected="2"),
             # title of the graph
             radioButtons(inputId = "price", label = "Price : ", choices = c("minimum","maximum"),selected="maximum"),
             
             sliderInput("bins",
                         "Number of bins:",
                         min = 1,
                         max = 50,
                         value = 30
             ),
             # input for the color
             colourInput(inputId = "color", label = "Color :", value = "purple")
             

             

           ),
           
           # Show a plot of the generated distribution
           mainPanel(
             plotOutput("distPlot"),
             dataTableOutput("priceTable"),
             # classes (div centrée)
           )
         )
)
