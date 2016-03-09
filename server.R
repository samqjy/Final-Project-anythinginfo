library(shiny)
library(plotly)
library(dplyr)
source("chloroplethMap.R")

shinyServer(function(input, output) {
  
  # Build interactive map
  output$map <- renderPlotly({
    Emission(input$years)
  })
})