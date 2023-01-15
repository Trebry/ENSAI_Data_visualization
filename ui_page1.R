#Home page
backgroundImageCSS <- "height: 91vh;
                        background-position: center;
                        background-repeat: no-repeat;
                        background-image: url('%s');
                        "
tabPanel(
  "Home",
  verbatimTextOutput("text1"),
  fluid = TRUE,
  style = sprintf(backgroundImageCSS,  "sncf.jpeg"),
  tags$style(HTML('
                #textbox {
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  align-content: center;
                }
              ')),
  br(),
  hr(),
  h2(HTML("<br> <br> <b>Dynamic data visualization with R project</b>"), style="text-align:center; color:white; font-size:600%"),
  h2(HTML("<b>Authors <br> Otis Cooper <br> Stein Dijkstra </b>"), style="text-align:center; color:white; font-size:300%")
)



# # Home page
# tabPanel(
#   "Welcome",
#   setBackgroundImage(
#    src = "sncf.jpeg"
#   ),
#   # textOutput("Project"),
#   # tags$head(tags$style("#Project{color: white;
#   #                               font-size: 30px;
#   #                               font-style: bold;
#   #                               }"
#   # )
#   # ),
#   # textOutput("Authors"), 
#   # textOutput("Authors1"), 
#   # textOutput("Authors2"),
#   
#   br(),
#   hr(),
#   h2(HTML("<br> <br> <b>Dynamic data visualization with R project</b>"), style="text-align:center; color:white; font-size:600%"), 
#   h2(HTML("<b>Authors <br> Otis Cooper <br> Stein Dijkstra </b>"), style="text-align:center; color:white; font-size:300%")
# )
 