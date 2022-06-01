library(ggplot2)
library(plotly)
library(dplyr)
library(ddpcr)
library(stringr)

source("winning_perc_data.R")

server <- function(input, output) {
  output$winning_perc_plot <- renderPlotly({
    wins_df <- wins_df %>%
      filter(country %in% input$country_selected)

    # barchart
    bar_chart <- ggplot(data = wins_df) +
      geom_col(mapping = aes(x = reorder(country, +winning_perc), y = winning_perc, fill = country)) +
      labs(title = "Winning Percentages by Countries in FIFA World Cup (1930-2018)", x = "Countries", y = "Winning Percentages (%)", fill = "Percentages (%)") +
      theme(text = element_text(size = 10, face = "bold"), plot.title = element_text(size = 20, face = "bold")) +
      coord_flip()

    return(bar_chart)
  })
}
