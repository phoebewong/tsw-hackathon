# Shiny 2.2
library(shiny)
library(plotly)
library(shinythemes)
# library(networkD3)
library(markdown)
library(leaflet)
library(DT)

shinyUI(fluidPage(
  theme = shinytheme("united"),
  # "theme_sexwell.css", #shinytheme("sandstone"),

  titlePanel(tags$img(src="logo.png", height=72,width=150),
             windowTitle = "SexWell"),
  navbarPage("",
             # theme = "theme_sexwell.css",
             tabPanel(icon = icon("home"),"Home",
                      HTML('<img src="homeimage.png"/ height=462 width=1272>'),
                      # img(src="homeimage.PNG", height=462,width=1272),
                      includeMarkdown("intro.md")
                      ),
             navbarMenu("Practitioners", icon = icon("stethoscope"),
                        tabPanel("List of practitioners", icon = icon("address-book-o"),
                                 # Columns to show
                                 selectInput('show_cols','Columns to show:', choices = NULL, #placeholder for rows
                                             multiple = TRUE, selectize = TRUE),
                                 # Rows/City to show
                                 selectInput('show_rows','City to show:', choices = NULL, #placeholder for rows
                                             multiple = TRUE, selectize = TRUE),
                                 dataTableOutput("table")),
                        
                        tabPanel("Add a Practitioner", icon = icon("plus"),
                                 tags$iframe(id = "googleform",
                                             src = "https://docs.google.com/forms/d/e/1FAIpQLSdVBTv1jj-DIAHSMQpLl4qjQOtNZk1qSro6FJQbgoSMYMhKbg/viewform?embedded=true",
                                             width = 760,
                                             height = 500,
                                             frameborder = 0,
                                             marginheight = 0)),
                        
                        tabPanel("Map of practitioners", icon = icon("map-marker"),
                                 leafletOutput("mymap"),
                                 p()),
                        
                        tabPanel("Live update list of practitioners", icon = icon("address-book"),
                                 DT::dataTableOutput("googleFormData"),
                                 actionButton("refresh", "Refresh Sheet"))#,
                        
                        ),
             navbarMenu("Education", icon = icon("graduation-cap"),
                        tabPanel("General Information", htmlOutput("frame")),
                        tabPanel("Symptoms", htmlOutput("symptoms")),
                        tabPanel("Causes", htmlOutput("causes")),
                        tabPanel("Statistics", htmlOutput("stat")),
                        tabPanel("Importance", htmlOutput("importance")),
                        tabPanel("Diagnosis", htmlOutput("diag")),
                        tabPanel("Treatment", htmlOutput("treat")),
                        tabPanel("Misconceptions", htmlOutput("miscon"))
                        ),
            tabPanel("Daily Journal",  icon = icon("book"),
                                 tags$iframe(id = "googleform",
                                             src = "https://docs.google.com/forms/d/e/1FAIpQLScrz4dacVTOBFxc-HDIbYKzo80lxX828XLL27mUz_OXaxZOww/viewform?embedded=true",
                                             width = 760,
                                             height = 500,
                                             frameborder = 0,
                                             marginheight = 0)),
             tabPanel("Contact",
                      includeMarkdown("contact.md"))
             )
))