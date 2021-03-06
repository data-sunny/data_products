# server.R file

    trading_revenue <- function(total_trades, total_wins, size_avg_wins, size_avg_losers) {
                                    win_rev <- total_wins*size_avg_wins
                                    loss_rev <- (total_trades-total_wins)*size_avg_losers
                                    revenue <- win_rev - loss_rev
                                    revenue}
    normalized_revenue <- function(total_trades, total_wins, size_avg_wins, size_avg_losers) {
                                    win_rev <- total_wins*size_avg_wins
                                    loss_rev <- (total_trades-total_wins)*size_avg_losers
                                    normalized_revenue <- (win_rev - loss_rev)/250
                                    normalized_revenue}

    app_is <- "The purpose of this App is to help a trader improve his trading performance.
This is achieved by inputting key measurements. At present this App then does simple calculations."

    app_runs <- "All you are required to do is to input the 4 values.
The app takes the 4 inputs and then does a simple calculation to generate the total revenue.
This is based on the formula :
revenue = ( winning trades count * avg size of wins ) - ( loosing trades count * avg size of losers)"

    app_inputs <- "The app requires 4 inputs
    1. total number of trades taken - a number in integers
    2. number of winning trades - this is simply the count of number of winning trades
    3. avg returns for wins ($) - this is the average of the revenue from all the winning trades
    4. avg returns for losers ($) - this is the average of the revenue from all the loser trades"

    app_outputs <- "The app generates 2 outputs
    1. trading revenue - which is the net $ return over the total number of trades
    2. normalized returns - this is the total trading revenue divided by typical risk per trade"

shinyServer(
    function(input, output) {
        output$results <- renderPrint({trading_revenue(
                            input$total_trades, input$total_wins, input$size_avg_wins, input$size_avg_losers)})
        output$results2 <- renderPrint({normalized_revenue(
                            input$total_trades, input$total_wins, input$size_avg_wins, input$size_avg_losers)})
        
        output$what_is_app <- renderText({app_is})
        output$run_app <- renderText({app_runs})
        output$inputs_to_app <- renderText({app_inputs})
        output$outputs_of_app <- renderText({app_outputs})
    }
)