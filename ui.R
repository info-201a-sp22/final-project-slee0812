library(plotly)

# 1. Customize your app via my_style
# 2. Publish your app

# Load climate data
climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

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
  "Introduction",
  fluidPage(
    includeMarkdown("intro_text.md")
  )
)

# We want our next tab to have a sidebar layout
# So we're going to create a sidebarPanel() and a mainPanel() and then add them together

# Create sidebar panel for widget
sidebar_panel_widget <- sidebarPanel(
  checkboxGroupInput(
    inputId = "country_selection",
    label = "Countries",
    choices = c("United States", "China", "South Africa"),
    # True allows you to select multiple choices...
    #multiple = TRUE,
    selected = "United States"
  )
)


# Put a plot in the middle of the page
main_panel_plot <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "climate_plot")
)


climate_tab <- tabPanel(
  "Climate Viz",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
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
  climate_tab,
  conclusion_tab
)

