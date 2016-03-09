library(shiny)
library(plotly)

shinyUI(
  fluidPage(
    titlePanel("Carbon Emission"),
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("year", label = h3("Year"), min = 1960, 
                    max = 2014, value = 1)
      ),
      mainPanel(
        plotlyOutput('carbon_plot')
      )
    )
  )
)