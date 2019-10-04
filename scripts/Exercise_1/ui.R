library(shiny)
#The most simple structure of the UI:
ui <- fluidPage(
  titlePanel("This is an actual Title"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "buttons",
        "Push a button",
        choices = c("One", "Two", "Three"),
        selected = "One"
      ),
      selectInput(
        "selector",
        "Select a color",
        choices = c("Blue", "Green", "Yellow")
      ),
      sliderInput(
        "slider",
        "Pick a range",
        min = 0,
        max = 100,
        value = c(10,30),
        pre = "€"
      )
    ),
    mainPanel()
  )
)