library(plotly)
library(bslib)

source("winning_perc_data.R")

# Manually Determine a BootSwatch Theme
my_theme <- bs_theme(bg = "#0b3d91", #background color
                  fg = "yellow", #foreground color
                  primary = "#FCC780", # primary color
) 
# Update BootSwatch Theme
my_theme <- bs_theme_update(my_theme, bootswatch = "cerulean") #%>% 
  # Add custom styling from a scss file
  #bs_add_rules(sass::sass_file("my_style.scss"))

# Home page tab
intro_tab <- tabPanel(
  # Title of tab
  "Introduction",
  fluidPage(
    includeMarkdown("intro_text.md"),
  )
)


# We want our next tab to have a sidebar layout
# So we're going to create a sidebarPanel() and a mainPanel() and then add them together

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
  )
)

# For chart 3

sidebar_panel_widget_3 <- sidebarPanel(
  selectInput(
    inputId = "variable_selection",
    label = "Factors",
    choices = c("GoalsScored" = 1, "QualifiedTeams" = 2, "Attendance" = 3),
    multiple = FALSE,
    selected = "GoalsScored"
  )
)

main_panel_plot_3 <- mainPanel(
  plotlyOutput(outputId = "chart_3")
)

correaltion_tab <- tabPanel(
  "Factors Correalation",
  sidebarLayout(
    sidebar_panel_widget_3,
    main_panel_plot_3
  )
)


# conclusion
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion_text.md")
  )
)

ui <- navbarPage(
  theme = my_theme,
  "FIFA World Cup Statistics",
  intro_tab,
  winning_tab,
  correaltion_tab,
  conclusion_tab
)