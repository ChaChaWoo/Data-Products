iris <- read.csv("hsb2.csv")

function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    scores[, c(input$xcol, input$ycol)]
  })
  
  # clustering algorithm
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster, pch = 25, cex = 3)
    points(clusters()$centers, pch = 1, cex = 5, lwd = 2)
  })
  
}