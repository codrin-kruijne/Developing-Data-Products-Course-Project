#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   data <- read.csv("https://stats.oecd.org/sdmx-json/data/DP_LIVE/.INCOMEINEQ.GINI.INEQ.A/OECD?contentType=csv&detail=code&separator=comma&csv-lang=en&startPeriod=2005&endPeriod=2015")
   countries <- unique(data$LOCATION)

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

  output$giniPlot <- renderPlot({

     # draw the the whole plot first
     ggplot(data[data$LOCATION == "PRT", ], aes(x = TIME, y = Value)) + geom_line()

  })

})
