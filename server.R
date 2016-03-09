source("chloroplethMap.R")
library(shiny)
library(dplyr)
library(plotly)

shinyServer(function(input, output) {
  output$carbon_plot <- renderPlotly({
    Emission(input$year)
  })
})