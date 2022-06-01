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
  )
)

ui <- navbarPage(
  # Select Theme
  theme = my_theme,
  # Home page title
  "Home Page",
  intro_tab,
  winning_tab
)