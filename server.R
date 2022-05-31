library(ggplot2)
library(plotly)
library(dplyr)

climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

server <- function(input, output) {

  output$climate_plot <- renderPlotly({

    filtered_df <- climate_df %>% 
      # Filter for country
      filter(country %in% input$country_selection)
    
    co2_plot <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = year, y = co2, color = country))

    return(co2_plot)
    
  })

}
