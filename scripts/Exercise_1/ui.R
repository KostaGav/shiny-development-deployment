library(shiny)
library(ggplot2)
library(plotly)
#The most simple structure of the UI:
ui <- fluidPage(
  titlePanel("Visualizing the mtcars data set"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "buttons",
        "Choose a mode of transmission",
        choices = c("automatic" = 0, "manual" = 1),
        selected = 0
      ),
      selectInput(
        "selector",
        "Select the number of cylinders",
        choices = c(4, 6, 8)
      ),
      sliderInput(
        "slider",
        "Pick a range of gross horsepower",
        min = 0,
        max = 400,
        value = c(10,300),
        pre = "hp"
      )
    ),
    mainPanel(
      plotlyOutput("greatPlot")
    )
  )
)