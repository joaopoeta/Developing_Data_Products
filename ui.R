library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Linear Regression with Random Numbers"),
        
        sidebarPanel(
                sliderInput('N', 'Samples size:',value = 5, min = 3, max = 30, step = 1),
                numericInput('delta', 'Arbitrary Straight Line Generator:', value = 0, min = -50, max = 50, step = 1),
                radioButtons('vertical', 'Vertical Line Control:', c("Without Verticals Distances" = "l0",  "Show Verticals to Arbitrary Line" = "l1", "Show Verticals to LR line Solution" = "l2"), inline = FALSE),
                checkboxInput(inputId = "legend",label = strong("Show Legend"),value = TRUE),
                textInput('valueToPredict', label="Predicting y (enter the value of x):", value = "0.5"),
                selectizeInput('seed', 'Seed to generate random numbers:', choices = c(1, 42, 77, 121),selected = 1)
                ),
        
        mainPanel(
                plotOutput('newHist'),
                tableOutput("resume")
  )
))

