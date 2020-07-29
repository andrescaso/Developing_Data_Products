library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predict the Weight of chicks by the age and different diets"),
    sidebarPanel(
        sliderInput("Days", 
                    "Number of Days since chicken birth:", 
                    min = 1,
                    max = 25, 
                    value = 10),
        selectInput("Diet", "Choose a diet:", 
                choices = c(1, 2, 3, 4)),
        ),
    mainPanel(
        h2("This url page help you to predict the weight of chicks in his early days,
            according two features, days of life and type of diet."),
        h3("Instructions:"),
        h3("1)  Select days of life from the left panel"),
        h3("2)  Select type of diet from the left panel"),
        h3("You can see the predicted weight as a black point in the graphic and the 
           value under this graphic."),
        h4('You selected this number of days:'),
        verbatimTextOutput("Days"),
        h4("You selected this type of Diet"),
        verbatimTextOutput("Diet"),
        plotOutput("Plot"),
        h4("Predicted Weight:"),
        verbatimTextOutput("Predicted")
        )
))