data(ChickWeight)
library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
         output$Days <- renderPrint({input$Days})
         output$Diet <- renderPrint({input$Diet})
         pred <- reactive({
              fit <- lm(weight ~ Time + Diet, data = ChickWeight)
              df <- data.frame(Time = input$Days,Diet = input$Diet)
              df$Diet <- as.factor(df$Diet)
              predict(fit, df)})
         output$Predicted <- renderPrint({pred()})
         output$Plot <- renderPlot({
              g <- ggplot(data = ChickWeight, aes(Time, weight)) + geom_line(aes(color=Diet)) + ggtitle("Predicted Weight")
              g  + geom_point(aes(input$Days,pred(),size=2))})
    })
