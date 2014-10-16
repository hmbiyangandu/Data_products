library(shiny)
shinyUI(fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information from the 2010 US Census."),
      br(),
      selectInput("var", label="Choose a variable to display",
                  choices=c("Percent White", "Percent Black", "Percent Indian", "Percent Asian"),
                  selected="Percent Black"
      ),
      sliderInput("range",label="Range of interest :", min=0, max=100, value=c(0,100))
    ),
    mainPanel(
      textOutput("text1"),
      textOutput("text2")
    )
  )
  
))