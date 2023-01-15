# Stations in France

tabPanel("Find a station",
         div(class="outer",
             # Use custom class so the map is full page
             tags$head(includeCSS("styles.css")),
             leafletOutput("map", width="100%", height="100%"),
             
             # Create a gradable overlay on the map
             absolutePanel(id = "controls", class = "panel",
                           top = 75, left = 55, width = 500, fixed=TRUE,
                           draggable = TRUE, height = "auto",
                           span(HTML("<b> Find the closest station to you </b> <br> <br>"),align = "left", style = "font-size:100%"),
                           textInput("adresse", "Fill in your adresse", "Rennes"),
                           actionButton("Getadresse", "Find me !"),
                           # Show coordinates of found adresse
                           #verbatimTextOutput("adresselng"),
                           #verbatimTextOutput("adresselat"),
                           verbatimTextOutput("station")
             )
         )
)