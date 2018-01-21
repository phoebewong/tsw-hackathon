# Shiny 2.2
library(DT)
library(dplyr)
library(ggplot2)
library("ggthemes")
library(scales)
library(shiny)
library(data.table)
library(plotly)
# library(igraph)
# library(networkD3)
library(markdown)
library(leaflet)
library(googlesheets)

shinyServer(function(input, output, session) {
  output$logo <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453761-pt4phackathonlogo",
                           height = 72,
                           width = 150,
                           scrolling = "no")
    print(graphic)
  })
  
  display.df <- reactive({
    #validate(need(input$meet.df != "", "Please upload a data set"))
    display.df <- meet.df()
    return(display.df)
  })
  # Columns to show (reactive)
  observe({ 
    x <- colnames(hospital.df)
    # Can use character(0) to remove all choices
    if (is.null(x)) x <- character(0)
    col_show <- c("Hospital.Name", "Address.1", "City", "State", "ZIP.Code", "County", "Phone.Number", "Hospital.Type", "Hospital.Ownership", "Emergency.Services")
    updateSelectizeInput(session, inputId = "show_cols",
                         label = "Columns to show:",
                         choices = x,
                         selected = x[x %in% col_show]
    )
  })
  # Rows to show (reactive)
  observe({ 
    x <- unique(hospital.df$City)
    # Can use character(0) to remove all choices
    if (is.null(x)) x <- character(0)
    row_show <- c("BOSTON")
    updateSelectizeInput(session, inputId = "show_rows",
                         label = "City to show:",
                         choices = x,
                         selected = x[x %in% row_show]
    )
  })
  
  output$table <- renderDataTable({
    hospital.df[which(hospital.df$City == input$show_rows), input$show_cols, drop = FALSE]
  })
  # Infographics
  output$frame <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27450590-pt4phackathon",
                           height = 5575,
                           width = 1000,
                           scrolling = "no")
    print(graphic)
  })
  
  output$symptoms <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453078-pt4phackathon2",
                           height = 8313,
                           width = 1280,
                           scrolling = "no")
    print(graphic) 
  })
  
  output$causes <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453095-pt4phackathon3",
                           height = 1300,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  output$stat <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453122-pt4phackathon4",
                           height = 1398,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  
  output$importance <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453136-pt4phackathon5",
                           height = 1148,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  
  output$diag <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453182-pt4phackathon6",
                           height = 953,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  
  output$treat <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453191-pt4phackathon7",
                           height = 970,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  
  output$miscon <- renderUI({
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/27453194-pt4phackathon8",
                           height = 882,
                           width = 1000,
                           scrolling = "no")
    print(graphic) 
  })
  # Map
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      # addProviderTiles(providers$Stamen.TonerLite,
      #                  options = providerTileOptions(noWrap = TRUE)) %>%
  
      addMarkers(data = hospital.df[, c("lon", "lat")],
                 label = hospital.df$Hospital.Name,
                 labelOptions = labelOptions(style = list("font-family" = "Ubuntu")),
                 popup = hospital.df$pop_content,
                 popupOptions = popupOptions(style = list("font-family" = "Ubuntu")))
  })
  # Live UPdate
  # ss <- gs_url(googleform_data_url, lookup = FALSE, visibility = "public")
  # output$googleFormData <- DT::renderDataTable({
  #   input$refresh
  #   ss_dat <- gs_read(ss) %>%
  #     mutate(Timestamp = Timestamp %>%
  #              as.POSIXct(format = "%m/%d/%Y %H:%M:%S", tz = "PST8PDT")) %>%
  #     #select(Timestamp, Hospital/Clinic_Name, Therapist_Name, Address_1) %>%
  #     arrange(desc(Timestamp))
  #   
  #   DT::datatable(ss_dat)
  # })
})