library(ggplot2)
library(plotly)
library(dplyr)
library(ddpcr)
library(stringr)

source("winning_perc_data.R")
WorldCup <- read.csv("data/WorldCups.csv")

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

  output$description_1 <- renderText({
    value <- paste("This bar chart displays the countries with their winning percentages in FIFA World Cup history from 1930 to 2018. This visualization will automatically arrange the order of countries based on their winning percentages, allowing you to easily find the countries with the highest or lowest winning percentage in the FIFA World Cup. The defaulted countries above are selected from the top two FIFA rankings for each continent, except for countries belonging to the Oceania Football Federation. With the widget in this page, you can freely choose as many countries you want. For example, if you compare Brazil's winning percentage with any other country, you will always get the same conclusion that Brazil has the highest winning percentage in the FIFA World Cup. In addition, if you select all countries shown on the graph, you will be able to find out that Tunisia has the lowest winning percentage.")

    return(value)
  })

  output$chart_3 <- renderPlotly({
    GSplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = GoalsScored, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and GoalsScored")

    QTplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = QualifiedTeams, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and QualifiedTeams")

    Atplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = Attendance, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and Attendance")

    if (input$variable_selection == 1) {
      return(GSplot)
    }
    if (input$variable_selection == 2) {
      return(QTplot)
    } else {
      return(Atplot)
    }
  })
}
