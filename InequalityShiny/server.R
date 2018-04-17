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
   minGini <- min(data$Value)
   maxGini <- max(data$Value)
   avgGini <- mean(data$Value)

   output$countrySelector <- renderUI({
      selectInput("country", "Select country:", as.list(countries))
   })

  output$giniPlot <- renderPlot({

     # draw the the whole plot first
      g <- ggplot(data[data$LOCATION == input$country, ], aes(x = TIME, y = Value)) +
            scale_y_continuous(limits = c(round(min(data$Value), 2), round(max(data$Value), 2))) +
            geom_line() +
            xlab("Year") +
            ylab("GINI coefficient")
      if (input$avgGini) {g <- g + geom_hline(aes(yintercept = avgGini), color = "blue", linetype = "dashed")}
      if (input$minGini) {g <- g + geom_hline(aes(yintercept = minGini), color = "green", linetype = "dashed")}
      if (input$maxGini) {g <- g + geom_hline(aes(yintercept = maxGini), color = "red", linetype = "dashed")}
      return(g)
  })

})
