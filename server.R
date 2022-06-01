library(ggplot2)
library(plotly)
library(dplyr)
library(ddpcr)
library(stringr)

source("winning_perc_data.R")
WorldCup <- read.csv("data/WorldCups.csv")
ff_data <- read.csv(file = "data/WorldCupMatches.csv")
ff_data_2018 <- read.csv(file = "data/world_cup_2018_stats.csv")

ff_data_2018 <- ff_data_2018 %>%
  distinct(Game, .keep_all = TRUE)


goals <- ff_data %>%
  group_by(Year) %>%
  summarise(Home_goals = sum(Home.Team.Goals), Away_goals = sum(Away.Team.Goals))

goals_2018 <- ff_data_2018 %>%
  summarize(Home_goals_2018 = sum(Goals.For), Away_goals_2018 = sum(Goals.Against))

goals[21, 1] <- 2018
goals[21, 2] <- goals_2018 %>%
  pull(Home_goals_2018)
goals[21, 3] <- goals_2018 %>%
  pull(Away_goals_2018)


goals_home_max <- goals %>%
  filter(Home_goals == max(Home_goals)) %>%
  pull(Year)

goals_away_max <- goals %>%
  filter(Away_goals == max(Away_goals)) %>%
  pull(Year)

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

  output$correalation_plot <- renderPlotly({
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
  
  output$comparision_plot <- renderPlotly({
    
    filtered_df <- goals %>%
    filter(Year >= input$year_selection[1] & Year <= input$ear_selection[2])
    
    score_plot <- ggplot(data = filtered_df) +
      geom_line(aes(x = Year, y = Home_goals, colour = "Home scores")) +
      geom_line(aes(x = Year, y = Away_goals, colour = "Away scores")) +
      labs(title = "Comparsion between Home Scores and Away Scores") +
      print(labs(y = "Goals", x = "Year")) +
    scale_x_continuous(breaks = seq(1930, 2018, by = 4))
    
    return(score_plot)
    
  })
}
