library(shiny)
# Define UI ----
ui <- fluidPage(
  titlePanel("Heng Javier"),
  sidebarLayout(
    position="left",
    sidebarPanel("https://github.com/Jav521/NM2207-New-"),
    mainPanel("Hey everyone! I'm Javier, 
              a student taking NM2207 this semester. 
              Here you can see my Github and whatever I've been working on 
              this sem!",
              img(src = "LinkedinPic.jpg", height = 400, width = 400)
              )
  )
)

# Define server logic ----
server <- function(input, output) {
}
# Run the app ----
shinyApp(ui = ui, server = server)
