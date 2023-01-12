# Home page
tabPanel("About this site",
         tags$div(
           tags$h4("About"), 
           "This application was developped by Otis Cooper Stein Dijkstra during their master's for Smart Data Science at ENSAI for the course of Data Visualization", 

           tags$br(),
           tags$br(),
           
           tags$h4("Code"), 
           "The code is available on ",
           tags$a(href="https://github.com/Trebry/ENSAI_Data_visualization", "github"),
           
           tags$br(),
           tags$br(),
           
           tags$h4("Data"), 
           "All the data we used is avaiable on the ",
           tags$a(href="https://ressources.data.sncf.com/pages/accueil/", "SNCF website")
         )
)