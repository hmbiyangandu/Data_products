library(shiny)
shinyUI(
  fluidPage(
    #Title of App
    titlePanel("Polygon Area/Perimeter Calulator"),
    
    #Sidebar
    sidebarLayout(
      sidebarPanel(
        helpText(em("Note: This application Calculate the Area and the Perimeter of regular Polygons, given the side lenght.",
                    a(href="help.html", "More details here."))
        ),
        br(),
        selectInput("nside",h5("Select a Polygon :"), 
                    choices = c("Triangle"=3, 
                    "Square"=4,
                    "Pentagon"=5,
                    "Hexagone"=6,
                    "Heptagon"=7,
                    "Octogon"=8,
                    "Nonagon"=9,
                    "Decagon"=10),3),
        numericInput("side",h5("Enter side lenght :"), min=1, value=1),
        br(),
        
        radioButtons("sUnit",h5("Unit"),
                     choices=c("cm (centimeters)"="cm",
                               "m (meters) "="m",
                               "in (inches)"="in",
                               "ft (feet)"="ft"),"m"),
        submitButton(text="Calculate")
      ),
      
      mainPanel(
        tabsetPanel(
          tabPanel("Results",
                   hr(),
                   p(textOutput("text"),
                     br(),
                     strong(
                       tags$ul(
                         tags$li(textOutput("areaText")),
                         tags$li(textOutput("perimeterText"))
                       )
                     )
                   )
                   
          ),
          tabPanel("Documentation", 
              p(
                  br(tags$b("Polygon Calculator")),
                  br("Use this calculator to calculate the Area and the Perimeter of commons regular",
                     br(),
                     " polygons (Tringle, Square, ..., Decagon)."
                  ),                 
                  br("To use the calculator :"),
                  br(),                  
                  tags$ol(
                    tags$li("Select the polygon name,"), 
                    tags$li("Enter the length of the side,"),
                    tags$li("Choose the Units in which the area and the perimeter will be calculated",
                            br(),
                            "(Note: this doen't influence on the computation, it is just for convenience.)"
                    ), 
                    tags$li("Press the button ",span("Calculate", style="color:blue"), "to get the result.")
                  ),
                  br("The results of computation are displayed in", tags$b("Results panel.")),
                  br("Note : By default when the App loads, the side is set to 1 and the polygon is Triangle.")
              )
        )
      )
    )  
)
))