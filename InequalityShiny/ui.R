#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Inequality by country 2005-2015 by GINI index"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       checkboxGroupInput("statsSelected", "Select for comparison",
                          c("Compare to average GINI" = "avgGini",
                            "Compare to min GINI" = "minGini",
                            "Compare to max GINI" = "maxGini"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       plotOutput("giniPlot")
    )
  )
))
