
library(dplyr)
library(plotly)
library(knitr)
options(stringsAsFactors = FALSE)


carbon <- read.csv("data/Carbon_Emission_Data.csv")
tem_change <- read.csv("data/tem_change.csv")
top_ten_emission <- tem_change %>% 
  arrange(desc(tem_change)) %>%
  head(n = 10) %>%
  select(Country, tem_change, X1960, X2014)

top_ten_emission <- arrange(top_ten_emission, desc(tem_change))
average_tem_change <- mean(tem_change$tem_change) %>%
  round(digits=2)
num_above_avg <- tem_change %>%
  filter(tem_change < average_tem_change) %>%
  ncol()
colnames(top_ten_emission) <- c('Top 10 Carbon Emission Countries',  'Temperature Change since 1960',
                                'Carbon Emission in 1960', 'Carbon Emission in 2014')

l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

temp_graph <- plot_ly(tem_change, z = tem_change, text = Country, locations = Code, type = 'choropleth',
        color = tem_change, colors = 'Oranges', marker = list(line = l),
        colorbar = list(ticksuffix = '˚C', title = 'Global Temperature change since 1960')) %>%
  layout(title = '2Global Temperature change since 1960<br>Source:<a href="http://berkeleyearth.lbl.gov/country-list/">Berkeley Earth</a>',
         geo = g)


