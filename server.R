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
  
  output$chart_3 <- renderPlotly({
    
    GSplot <- ggplot(data = WorldCup) +
      geom_point(aes(x=MatchesPlayed, y=GoalsScored, colour=MatchesPlayed)) + 
      labs(title = "Correlation between MatchesPlayed and GoalsScored")
    
    QTplot <- ggplot(data = WorldCup) +
      geom_point(aes(x=MatchesPlayed, y=QualifiedTeams, colour=MatchesPlayed)) + 
      labs(title = "Correlation between MatchesPlayed and QualifiedTeams")
    
    Atplot <- ggplot(data = WorldCup) +
      geom_point(aes(x=MatchesPlayed, y=Attendance, colour=MatchesPlayed)) + 
      labs(title = "Correlation between MatchesPlayed and Attendance")
    
    if (input$variable_selection == 1) {return(GSplot)}
    if (input$variable_selection == 2) {return(QTplot)}
    else {return(Atplot)}
    
  })
}
