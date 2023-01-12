# Home page
# tabPanel("First map", 
#          leafletOutput("map", width="100%", height="100%")
#          # mainPanel(
#          #   leafletOutput("map"),
#          #   width="100%", height="800px"
#          #   #width = 12,
#          #   #height = 12
#          #  ),
#          )

tabPanel("Stations in France",
         div(class="outer",
             tags$head(includeCSS("styles.css")),
             leafletOutput("map", width="100%", height="100%"),
             absolutePanel(id = "controls", class = "panel",
                           top = 75, left = 55, width = 500, fixed=TRUE,
                           draggable = TRUE, height = "auto",
                           span(("We can add some information here or what ever"),align = "left", style = "font-size:100%"),
                           textInput("adresse", "Fill in your adresse", "Rennes"),
                           actionButton("Getadresse", "Find me !"),
                           verbatimTextOutput("adresselng"),
                           verbatimTextOutput("adresselat"),
                           verbatimTextOutput("station")
             )
         )
)