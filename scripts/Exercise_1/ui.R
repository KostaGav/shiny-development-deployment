library(shiny)
library(tidyverse)
library(plotly)
library(titanic)
#The most simple structure of the UI:
ui <- fluidPage(
  titlePanel("Visualizing the Titanic data set"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "buttons",
        "Did the passenger survive?",
        choices = c("did not survive" = 0, "survive" = 1),
        selected = 0
      ),
      selectInput(
        "selector",
        "Select the class of the passenger",
        choices = c(1, 2, 3)
      ),
      sliderInput(
        "slider",
        "Pick a range of fare (in $)",
        min = 0,
        max = 550,
        value = c(10,50),
        pre = "$"
      )
    ),
    mainPanel(
      plotlyOutput("greatPlot")
    )
  )
)