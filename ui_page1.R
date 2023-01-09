# Home page
 backgroundImageCSS <- "height: 91vh;
                        background-position: center;
                        background-repeat: no-repeat;
                        background-image: url('%s');
                        "
tabPanel(
  "Welcome",
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
)