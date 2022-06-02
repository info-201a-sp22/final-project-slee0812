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
      labs(title = "Winning Percentages by Countries in FIFA World Cup (1930-2018)", x = "Countries", y = "Winning Percentages (%)", fill = "Country") +
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
      theme(text = element_text(size = 10, face = "bold"), plot.title = element_text(size = 20, face = "bold"))

    QTplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = QualifiedTeams, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and QualifiedTeams") +
      theme(text = element_text(size = 10, face = "bold"), plot.title = element_text(size = 20, face = "bold"))

    Atplot <- ggplot(data = WorldCup) +
      geom_point(aes(x = MatchesPlayed, y = Attendance, colour = MatchesPlayed)) +
      labs(title = "Correlation between MatchesPlayed and Attendance") +
      theme(text = element_text(size = 10, face = "bold"), plot.title = element_text(size = 20, face = "bold"))

    if (input$variable_selection == 1) {
      return(GSplot)
    }
    if (input$variable_selection == 2) {
      return(QTplot)
    } else {
      return(Atplot)
    }
  })

  output$description_2 <- renderText({
    value_2 <- paste("This chart studies the correlation between the Matches played in a year and the total scores. Intuitively speaking, more matches will lead to more goals but their relation might not be perfectly linear, so we include this chart to explore the authentic correlation between these two variables.")

    return(value_2)
  })


  # Page 3
  output$comparision_plot <- renderPlotly({
    filtered_df <- goals %>%
      filter(Year >= input$year_selection[1] & Year <= input$year_selection[2])

    score_plot <- ggplot(data = filtered_df) +
      geom_line(aes(x = Year, y = Home_goals, colour = "Home scores")) +
      geom_line(aes(x = Year, y = Away_goals, colour = "Away scores")) +
      labs(title = "Comparsion between Home Scores and Away Scores") +
      theme(text = element_text(size = 10, face = "bold"), plot.title = element_text(size = 20, face = "bold"), axis.text.x = element_text(angle = -90)) +
      print(labs(y = "Goals", x = "Year")) +
      scale_x_continuous(breaks = seq(1930, 2018, by = 4))

    return(score_plot)
  })

  output$description_3 <- renderText({
    value_3 <- paste("The purpose of this chart is to compare the number of home team goals and away team goals over the history of FIFA World Cup. To do so, our team used a line chart because it is easy to track the number of total goals for each World Cup held in every 4 years and investigate whether home teams have an advantage over away teams. We grouped up each World Cup by its year and summed up total home team goals and away team goals, respectively. In result, we found that the most goals that home teams scored were in 1954 and the most goals that away teams scored were in 2014, which was the most recent World Cup in Russia. Moreover, this chart displays that the home teams scored more than the away teams, but this phenomenon no longer exists in recent years, concluding that home-field advantage does not affect the game result.")

    return(value_3)
  })
}