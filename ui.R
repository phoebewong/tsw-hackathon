# Shiny 2.2
library(shiny)
library(plotly)
library(shinythemes)
# library(networkD3)
library(markdown)
shinyUI(fluidPage(
  theme = "theme_sexwell.css", #shinytheme("sandstone"),
  
  titlePanel("SexWell"),
  
  # sidebarLayout(
      mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Introduction", 
                           includeMarkdown("intro.md")),
                  tabPanel("Where can I find practitioners?", 
                           # Columns to show
                           selectInput('show_cols','Columns to show:', choices = NULL, #placeholder for rows
                                       multiple = TRUE, selectize = TRUE),
                           # Rows/City to show
                           selectInput('show_rows','City to show:', choices = NULL, #placeholder for rows
                                       multiple = TRUE, selectize = TRUE),
                           dataTableOutput("table")),
                  tabPanel("Infographics", 
                           # includeMarkdown("infographics.md")
                           htmlOutput("frame")),
                  tabPanel("Daily Journal", 
                           tags$iframe(id = "googleform",
                                       src = "https://docs.google.com/forms/d/e/1FAIpQLScrz4dacVTOBFxc-HDIbYKzo80lxX828XLL27mUz_OXaxZOww/viewform?embedded=true",
                                       width = 760,
                                       height = 500,
                                       frameborder = 0,
                                       marginheight = 0))
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
                  )
    )  
  # )
))