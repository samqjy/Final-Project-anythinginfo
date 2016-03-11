library(shiny)
library(plotly)
library(dplyr)
source("chloroplethMap.R")

shinyServer(function(input, output) {
  
  # Build interactive map
  output$chloropleth <- renderPlotly({
    Emission(input$years)
  })
  
  # Build interactive chart
  output$chart <- renderPlotly({
    blah(input$countries)
  })
})