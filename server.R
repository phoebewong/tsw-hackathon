# Shiny 2.2
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
# library(bizdays)


shinyServer(function(input, output, session) {
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
    graphic <- tags$iframe(src = "https://create.piktochart.com/embed/7287546-endometriosis-pelvic-pain-final",
                           height = 7136,
                           width = 1280)
    print(graphic)
  })
})