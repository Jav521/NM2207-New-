library(shiny)
# Define UI ----
ui <- fluidPage(
  titlePanel("Heng Javier"),
  sidebarLayout(
    position="left",
    sidebarPanel("I like NM2207"),
    mainPanel(img(src = "LinkedinPic.jpg", height = 140, width = 400)
)
  )
)


# Define server logic ----
server <- function(input, output) {
}
# Run the app ----
shinyApp(ui = ui, server = server)
