# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Heng Javier"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(

    
    # Sidebar panel for inputs ----
    sidebarPanel(
       
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10) ,
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),
      
      # Output: HTML table with requested number of observations ----
      tableOutput("view"),
      
      imageOutput("img")
      
    )
  )
)

# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  output$img <-  renderImage({
    if (input$dataset == "rock"){
      width<- "80%"
      height<- "20%"
      list(src = "www/rock.jpg",
           width = width,
           height = "auto"
      )
    }
    else if (input$dataset == "pressure"){
      width<- "80%"
      height<- "20%"
      list(src = "www/pressure.png",
           width = width,
           height = "auto"
      )
    }
    else {
      width<- "80%"
      height<- "20%"
      list(src = "www/cars.jpg",
           width = width,
           height = "auto"
      )
    }
  })
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)