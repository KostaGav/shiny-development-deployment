#Back end

# The server function takes input and output as arguments
# input: Input provided by the user to specify a certain appearance, data or result
# output: The output created by the functions specified in the back end
server <- function(input, output){
  
  #Create a reactive variable to use it for different objects interactively
  filtered <- reactive({
    mtcars %>% 
      filter(hp >= input$slider[1],
             hp <= input$slider[2],
             cyl == input$selector,
             am == input$buttons)
  })
  
  #Plot the variables of the mtcars data set
  # Using if-conditions to specify the variables being plotted
  output$greatPlot <- renderPlotly({

    if(input$checkbox == TRUE){
      x <- filtered()[,input$selectVars]
      plotHist <- ggplot(filtered(), aes(x)) + 
        geom_histogram()
    } else {
      x <- mtcars[,input$selectVars]
      plotHist <- ggplot(mtcars, aes(x)) + 
        geom_histogram()
    }
    
    
    ggplotly(plotHist)
  })
}