library(shiny)
library(plotly)
library(dplyr)
source("chloroplethMap.R")
source("CountryEmision.R")

shinyServer(function(input, output) {
  
  # Build interactive map
  output$chloropleth <- renderPlotly({
    Emission(input$years)
  })
  
  # Build interactive chart
  output$chart <- renderPlotly({
    country_Emissions(input$countries)
  }) 
})