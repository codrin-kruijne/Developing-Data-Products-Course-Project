Shiny App to explore Inequality
========================================================
author: Codrin Kruijne
date: 17/04/2018
autosize: true

OECS Data on inequality
========================================================

- The goals of this app is to let the user explore how inequality has developed their country over the last decades.
- The dataset was obtained from [OECD data](https://data.oecd.org/inequality/income-inequality.htm)
- One way to measure inequality is the [GINI coefficient](https://en.wikipedia.org/wiki/Gini_coefficient)

App approach
========================================================

The user experience I want to create is to allow the user to:
- Select their country to see GINI inequality measurement over the years
- See the average over all countries to compare
- See the highest GINI value
- See the lowest GINI value

Imagined outcome
========================================================

A non interactive example would show this for The Netherlands:

![plot of chunk unnamed-chunk-1](InequalityShinyPitch-figure/unnamed-chunk-1-1.png)

Implementation
========================================================
- a dropdown menu was used to let the user choose a country from the dataset. The options are laoded from the server.
- three checkboxes allow the user to check whether minimum, average or maximum GINI value from this dataset is displayed. The server calculates the value and then adapts the plot with lines.

Options for further development:
- lookup full country names for nicer selection box
- Compare more countries at the same time
- Highlight increase or decreas over time
- Add an interactive legend
- etc.

But for now it shows I can make a simple Shiny app :-)!!!
You can try it here: [My first Shiny app exploring Inequality on ShinyApps.io](https://codrin.shinyapps.io/Shiny-App-Inequality/)
