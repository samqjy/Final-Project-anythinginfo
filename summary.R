
library(dplyr)
library(plotly)
library(knitr)
options(stringsAsFactors = FALSE)
#tem_change <- read.csv("data/tem_change.csv")


# Pass in the tem_change dataset and get the average temperature change
get_avg <- function(tem_change) {
  return(mean(tem_change$tem_change) %>%
          round(digits=2))
}

#Pass in the tem_change dataset and get the number of countries above the average change
get_num_above_avg <- function(tem_change) {
  return(tem_change %>%
          filter(tem_change < mean(tem_change$tem_change)) %>%
           ncol())
}

# Pass in the dataset of the temperature change and the function will return the top ten table
get_top_ten <- function(tem_change) {
  top_ten_emission <- tem_change %>% 
    arrange(desc(tem_change)) %>%
      head(n = 10) %>%
        select(Country, tem_change, X1960, X2014)
    
  top_ten_emission <- arrange(top_ten_emission, desc(tem_change))
  
  colnames(top_ten_emission) <- c('Top 10 Carbon Emission Countries',  'Temperature Change since 1960',
                                  'Carbon Emission in 1960', 'Carbon Emission in 2014')
  kable(top_ten_emission)
  
}

# Get a graph of the global temperature change
get_graph <- function(tem_change) {
  l <- list(color = toRGB("grey"), width = 0.5)
  
  
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  plot_ly(tem_change, z = tem_change, text = Country, locations = Code, type = 'choropleth',
          color = tem_change, colors = 'Oranges', marker = list(line = l),
          colorbar = list(ticksuffix = '˚C', title = 'Global Temperature change since 1960')) %>%
              layout(title = '2Global Temperature change since 1960<br>Source:<a href="http://berkeleyearth.lbl.gov/country-list/">Berkeley Earth</a>',
                     geo = g)
    
}



