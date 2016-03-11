#function takes in a country and returns a scatter of that 
#country's emission from 1960 to 2014
library(plotly)

df <- read.csv('data/Carbon_Emission_Data.csv')

#creating a vector of years for the scatter plot data
col <- substring(colnames(df)[3:57], 2)
col <- as.numeric(col)

#replacing all NA values with 0
df[is.na(df)] <- 0.0

country_Emissions <- function(country, dataCount = df, cols = col ){
  #selecting only the data from the country specified
  dataCount <- dataCount[dataCount$Country == country,]
  dataCount <- as.numeric(dataCount[3:57])
 
  #creating data frame of country's emissions and the years
  data <- data.frame(Emissions = dataCount, Year = cols)
  
  plot_ly(data, x = cols, y = Emissions ,  type= "scatter", color ='Reds', mode = "markers")
}

#test for function
#bla <- country_Emissions("Canada")

