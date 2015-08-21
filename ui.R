# ui.R file 

#install.packages(shiny)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Trading Performance Prediction"),
        
        sidebarPanel(
            numericInput('total_trades', '1. total trades taken', 10, min = 0, max = 100),
            numericInput('total_wins', '2. number of winning trades', 5, min = 0, max = 100),
            numericInput('size_avg_wins', '3. avg returns for wins ($)', 500, min = 0, max = 1000),
            numericInput('size_avg_losers', '4. avg returns for losers ($)', 250, min = 0, max = 1000),submitButton('Submit')
        ),
        mainPanel(

            tabsetPanel(
        tabPanel("Results", 
            h4("trading revenue $"), verbatimTextOutput("results"), 
            h4("with initial risk unit of $ 250/trade the normalized returns in units of risk are"), verbatimTextOutput("results2")),
                                tabPanel("What is App", verbatimTextOutput("what_is_app")),   
                                tabPanel("How to Run App", verbatimTextOutput("run_app")), 
                                tabPanel("Inputs", verbatimTextOutput("inputs_to_app")),   
                                tabPanel("Outputs", verbatimTextOutput("outputs_of_app"))
                                                 )
        )

    )
)