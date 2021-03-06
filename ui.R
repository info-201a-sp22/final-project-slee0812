library(plotly)
library(bslib)

source("trimmedData.R")

my_theme <- bs_theme(
  bg = "#0b3d91", # background color
  fg = "yellow", # foreground color
  primary = "#FCC780", # primary color
  base_font = font_google("Prompt"),
  code_font = font_google("JetBrains Mono")
)

# Update BootSwatch Theme
my_theme <- bs_theme_update(my_theme, bootswatch = "sandstone")


# Intro
intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("intro_text.md"),
  )
)


# Page 1
sidebar_panel_widget <- sidebarPanel(
  selectInput(
    inputId = "country_selected",
    label = h5("Country"),
    choices = wins_df$country,
    multiple = TRUE,
    selected = c("Brazil", "Argentina", "Belgium", "France", "Japan", "Korea Republic", "Senegal", "Morocco", "Mexico", "USA")
  )
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "winning_perc_plot")
)

winning_tab <- tabPanel(
  "Winning %",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  ),
  fluidPage(
    textOutput(outputId = "description_1")
  )
)


# Page 2
sidebar_panel_widget_2 <- sidebarPanel(
  selectInput(
    inputId = "variable_selection",
    label = "Factors",
    choices = c("GoalsScored" = 1, "Attendance" = 2),
    multiple = FALSE,
    selected = "GoalsScored"
  )
)

main_panel_plot_2 <- mainPanel(
  plotlyOutput(outputId = "correalation_plot")
)

correaltion_tab <- tabPanel(
  "Total Goals & Attendance",
  sidebarLayout(
    sidebar_panel_widget_2,
    main_panel_plot_2
  ),
  fluidPage(
    textOutput(outputId = "description_2")
  )
)


# Page 3
sidebar_panel_widget_3 <- sidebarPanel(
  sliderInput(
    inputId = "year_selection",
    label = h3("Time Range"),
    min = min(goals$Year),
    max = max(goals$Year),
    step = 4,
    value = c(min(goals$Year), max(goals$Year))
  )
)

main_panel_plot_3 <- mainPanel(
  plotlyOutput(outputId = "comparision_plot")
)

comparision_tab <- tabPanel(
  "HS/AS Comparision",
  sidebarLayout(
    sidebar_panel_widget_3,
    main_panel_plot_3
  ),
  fluidPage(
    textOutput(outputId = "description_3")
  )
)


# conclusion
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion_text.md")
  )
)


# ui
ui <- navbarPage(
  theme = my_theme,
  "FIFA World Cup Statistics",
  intro_tab,
  winning_tab,
  correaltion_tab,
  comparision_tab,
  conclusion_tab
)