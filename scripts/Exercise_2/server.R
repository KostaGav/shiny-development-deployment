#Back end

# The server function takes input and output as arguments
# input: Input provided by the user to specify a certain appearance, data or result
# output: The output created by the functions specified in the back end
server <- function(input, output){
  
  #Create a reactive variable to use it for different objects interactively
  filtered <- reactive({
    titanic_train %>% 
      filter(Fare >= input$slider[1],
             Fare <= input$slider[2],
             Pclass == input$selector,
             Survived == input$buttons)
  })
  
  #Plot the variables of the titanic_train data set
  # Using if-conditions to specify the variables being plotted
  output$greatPlot <- renderPlotly({

    if(input$checkbox == TRUE){
      x <- filtered()[,input$selectVars]
      plotHist <- ggplot(filtered(), aes(x)) + 
        geom_histogram()
    } else {
      x <- titanic_train[,input$selectVars]
      plotHist <- ggplot(titanic_train, aes(x)) + 
        geom_histogram()
    }
    
    
    ggplotly(plotHist)
  })
  
  output$goodText <- renderText({
    
    if(input$checkbox == TRUE){
      x <- nrow(filtered()[filtered()$Survived==1,])
      text <- paste0("Using your filter ", x," passengers have survived")
      return(text)
    } else {
      x <- nrow(titanic_train[titanic_train$Survived==1,])
      text <- paste0("In total ", x," passengers have survived")
      return(text)
    }
    

  })
  
}