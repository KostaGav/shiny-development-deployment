#Back end

# The server function takes input and output as arguments
# input: Input provided by the user to specify a certain appearance, data or result
# output: The output created by the functions specified in the back end
server <- function(input, output){
  
  output$greatPlot <- renderPlotly({
    
    filteredData <- 
      mtcars %>% 
      filter(hp >= input$slider[1],
             hp <= input$slider[2],
             cyl == input$selector,
             am == input$buttons)
    
    plotHist <- ggplot(filteredData, aes(mpg)) + 
      geom_histogram()
    
    ggplotly(plotHist)
  })
}