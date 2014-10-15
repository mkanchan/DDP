library(UsingR)
#####################################
# Developing Data Products - Course Project
# Author : Mukesh Kanchan
# Comment: All data from UI.R read here and used for plot.  Few things to note:
#         + Use fo Group Check Box - this returns vector when both boxes 
#           are checked, and NULL when nothing is checked. This is handled using
#           if controls
#         + Main label of plot is created dynamically by pasted 'seed' value
#         + Summary is computed based on input data
#####################################
shinyServer(
        function(input, output) {
                output$newPlot <- renderPlot({
                        num <- as.numeric(input$num)
                        mean <- input$mean
                        sd <- input$sd
                        if (length(input$plotType) == 0 ) 
                                plotType <- 'n'
                        else if (length(input$plotType) > 1 ) 
                                plotType <- 'o'
                        else
                                plotType <- input$plotType
                        color <- input$color
                        seed <- input$seedVal
                        if (is.null(seed)) seed <- 1234
                        set.seed(seed)
                        data <- rnorm(num, mean, sd)
                        plot(data, 
                             type=plotType, 
                             col=color, 
                             xlab='Number', 
                             ylab='Value',
                             main=paste('Normal Distribution of Random Data.  [Seed:',paste(seed,']')))
                        output$displayData <- renderTable(data.frame(rbind(summary(data))))
                })
                
        }
)
