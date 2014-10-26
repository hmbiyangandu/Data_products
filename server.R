library(shiny)
calculateArea <- function(s,n){
  0.25*n*(s^2)/tan(pi/n)  
}

calculatePerimeter <- function(s,n){
  n*s 
}

shinyServer(
  function(input, output){
    output$sUnit <- renderText({input$sUnit})
    
    polygonInput <- reactive({
      switch(input$nside,
          "3"="Triangle",
          "4"="Square",
          "5"="Pentagon",
          "6"="Hexagon",
          "7"="Heptagon",
          "8"="Octogone",
          "9"="Nanogon",
          "10"="Decagon"
      )
    })
    
    area <- reactive({calculateArea(input$side, as.numeric(input$nside))})
    
    perimeter <-reactive({calculatePerimeter(input$side, as.numeric(input$nside))})

    output$text <- renderText({
      paste("A(n)", polygonInput(), "with a side of", input$side, input$sUnit, ", has :"," ")}
    )
    output$areaText <- renderText({
      paste("Area = ",round(area(),2)," ",input$sUnit,"^2",sep="")
    })
    output$perimeterText <- renderText({
      paste("Perimeter = ",perimeter(), input$sUnit)
    })
        
  }
)