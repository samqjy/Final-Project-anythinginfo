library(plotly)
library(dplyr)

df <- read.csv('data/Carbon_Emission_Data.csv')
data <- read.csv('data/Country_area_2.csv')
#replacing all NA values with 0
df[is.na(df)] <- 0.0

#setting default dataframes so we don't have to readthem in everytime
Emission <- function(year, carbon = df, area = data ){

  #changing year variable to be the same as column name  
  year <- paste0("X",year)
  
  #getting the year and code columns and changing year column name to year
  year_col <- carbon %>% select_(year=year, "Code")
  
  #Joining the emissions data with the area data
  joined <- right_join(year_col, area, by = "Code")
  
  joined$hover <-paste( joined$Country , "total Emissions", joined$year)
  
  l <- list(color = toRGB("grey"), width = 0.5)
  
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  #setting visuals to be the total country emission divided by the country area in km^2 
  # because other wise most countries wouldn't show up with color
  plot_ly(joined, z = as.numeric(year)/as.numeric(Area_km), text = hover, locations = Code, type = 'choropleth',
          color = as.numeric(year)/as.numeric(Area_km), colors = 'Reds', marker = list(line = l),
          colorbar = list(title = 'Emissions')) %>%
    layout(title = 'Carbon Emissions Million Metric Tons per Kilometer',
           geo = g)
}

#testing the Emission function
#Emission(2014)
#Emission(1990)
#Emission(1980)
#Emission(1960)
#Emission(1962)
