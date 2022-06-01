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
    # # Include a Markdown file!
    # includeMarkdown("intro_text.md"),
    p("Our project is focusing neww.....")
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
  ),
  fluidPage(
    p("This bar chart displays the countries with their winning percentages in FIFA World Cup history from 1930 to 2018. This visualization will automatically arrange the order of countries based on their winning percentages, allowing you to easily find the countries with the highest or lowest winning percentage in the FIFA World Cup. The defaulted countries above are selected from the top two FIFA rankings for each continent, except for countries belonging to the Oceania Football Federation. With the widget in this page, you can freely choose as many countries you want. For example, if you compare Brazil's winning percentage with any other country, you will always get the same conclusion that Brazil has the highest winning percentage in the FIFA World Cup. In addition, if you select all countries shown on the graph, you will be able to find out that Tunisia has the lowest winning percentage.")
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
  conclusion_tab
)