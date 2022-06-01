library(ggplot2)
library(plotly)
library(dplyr)
library(ddpcr)
library(stringr)

source("trimmedData.R")

# server
server <- function(input, output) {

  # Page 1
  output$winning_perc_plot <- renderPlotly({
    wins_df <- wins_df %>%
      filter(country %in% input$country_selected)

    # bar_chart
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


  # Page 2
  output$correalation_plot <- renderPlotly({
    GSplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = GoalsScored, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and GoalsScored") + 
      theme(plot.title = element_text(size = 20, face = "bold"))

    QTplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = QualifiedTeams, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and QualifiedTeams") +
      theme(plot.title = element_text(size = 20, face = "bold"))

    Atplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = Attendance, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and Attendance") +
      theme(plot.title = element_text(size = 20, face = "bold"))

    if (input$variable_selection == 1) {
      return(GSplot)
    }
    if (input$variable_selection == 2) {
      return(QTplot)
    } else {
      return(Atplot)
    }
  })


  # Page 3
  output$comparision_plot <- renderPlotly({
    filtered_df <- goals %>%
      filter(Year >= input$year_selection[1] & Year <= input$year_selection[2])

    score_plot <- ggplot(data = filtered_df) +
      geom_line(aes(x = Year, y = Home_goals, colour = "Home scores")) +
      geom_line(aes(x = Year, y = Away_goals, colour = "Away scores")) +
      labs(title = "Comparsion between Home Scores and Away Scores") +
      theme(plot.title = element_text(size = 20, face = "bold")) +
      print(labs(y = "Goals", x = "Year")) +
      scale_x_continuous(breaks = seq(1930, 2018, by = 4))

    return(score_plot)
  })
}