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

   output$countrySelector <- renderUI({
      selectInput("country", "Select country:", as.list(countries))
   })

  output$giniPlot <- renderPlot({

     # draw the the whole plot first
      g <- ggplot(data[data$LOCATION == input$country, ], aes(x = TIME, y = Value)) + geom_line()
      if (input$avgGini) {g <- g + geom_hline(aes(yintercept = 0.2), color = "blue", linetype = "dashed")}
      if (input$minGini) {g <- g + geom_hline(aes(yintercept = 0.1), color = "green", linetype = "dashed")}
      if (input$maxGini) {g <- g + geom_hline(aes(yintercept = 0.3), color = "red", linetype = "dashed")}
      return(g)
  })

})
