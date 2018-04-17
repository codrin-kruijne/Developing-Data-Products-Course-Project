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
       uiOutput("countrySelector"),
       checkboxInput("avgGini", "Show average GINI"),
       checkboxInput("minGini", "Show min GINI"),
       checkboxInput("maxGini", "Show max GINI")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("giniPlot")
    )
  )
))
