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
  # titlePanel(img(src="logo.PNG",height=72,width=150)),
  # titlePanel(htmlOutput("logo")),
  titlePanel( HTML('<img src="logo.PNG"/ height=72 width=150>')),
  
  # titlePanel("SexWell"),
  
  # sidebarLayout(
      # mainPanel(
      # tabsetPanel(type = "tabs", 
  navbarPage("",
             # img(src="logo.PNG",height=72,width=72),
             # theme = "theme_sexwell.css",
             tabPanel(icon = icon("home"),"Home",
                      HTML('<img src="homeimage.PNG"/ height=462 width=1272>'),
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
                        
                        tabPanel("Live Update List of practitioners", icon = icon("address-book"))
                                 # DT::dataTableOutput("googleFormData"),
                                 # actionButton("refresh", "Refresh Sheet"))#,
                        
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
             
             # tabPanel("Education", icon = icon("graduation-cap"),
             #          # includeMarkdown("infographics.md")
             #          htmlOutput("frame")),
             # navbarMenu("Tracking", icon = icon("book"),
              tabPanel("Daily Journal",  icon = icon("book"),
                                 tags$iframe(id = "googleform",
                                             src = "https://docs.google.com/forms/d/e/1FAIpQLScrz4dacVTOBFxc-HDIbYKzo80lxX828XLL27mUz_OXaxZOww/viewform?embedded=true",
                                             width = 760,
                                             height = 500,
                                             frameborder = 0,
                                             marginheight = 0))
                        # )
             )

                  # tabPanel("Summary", 
                  #          h2(textOutput("summary1")),
                  #          sliderInput("workhours", "Work Hours per Day:",min=1, max=24, value=8),
                  #          # numericInput("bizdaycount", "Number of Business Days:", value = NULL,
                  #          #              min=1, max=100, step=1),
                  #          h3(textOutput("summary2")),
                  #          checkboxInput("sortbyFreq", "Sort by Frequency", value = FALSE),
                  #          plotOutput("monthplot"),
                  #          downloadButton("downloadmonthplot", "Download the Plot Above"),
                  #          plotOutput("monthtimeplot"),
                  #          downloadButton("downloadmonthtimeplot", "Download the Plot Above")),
                  # 
                  # tabPanel("Plot: People",
                  #          h3(textOutput("summary3")),
                  #          tags$hr(),
                  #          # Number of people to show
                  #          sliderInput("n", "Number of People to Show:",min=1, max=40, value=20),
                  #          plotOutput("plot1"),
                  #          downloadButton("downloadplot1", "Download the Plot Above"),
                  #          
                  #          plotOutput("plot2"),
                  #          downloadButton("downloadplot2", "Download the Plot Above")),
                  # 
                  # tabPanel("Interactive Heatmap: Time", plotlyOutput("timeplot1"),
                  #          checkboxInput("showname", "Show Event Name", value = TRUE)),
                  # tabPanel("Fun Facts", 
                  #          h4(textOutput("introdateplot")),
                  #          h5(textOutput("summarydateplot")),
                  #          plotOutput("dateplot"),
                  #          downloadButton("downloaddateplot", "Download the Plot Above")),
                  # tabPanel("Contact", 
                  #          includeMarkdown("contact.md"))
                  # )
    # )  
  # )
))