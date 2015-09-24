# ui.R

library(rCharts)

demographic <- read.csv('Canada_Demographic.csv')

# Define UI 
shinyUI(fluidPage(
  tags$head(includeScript("google-analytics.js")),
  
  # Title
  titlePanel("Marital Status Dempgraphic Changes in Canada"),
  p("This project explores the marital status demographic changes in Canada over the last 5 years (2010-2014)."),
  p("The plots show the trends for 6 marital states for both, male and female.  It also shows the total of all states (all)."), 
  p(" "),
  hr(),
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Status", 
                  label = "Select a marital status to display trends for:", 
                  choices = c("All",
                              "Single",
                              "Married",
                              "Separated",
                              "CommonLaw",
                              "Widowed",
                              "Divorced"
                             ), 
                  selected = "All"), 
      helpText(p("Use the dropdown to select the marital status you would like to explore."), p("Plot Created on 23 Sep 2015 by Egarelnabi"), p("This plot was created for JHU's Developing Data Products"))
    ),
    
    # Show the plot 
    mainPanel(
    strong("Allow some time for the plot time to load. You can also show/hide series by clicking them below the plot."),
    showOutput("lexplot", "highcharts"),
    em("The data was obtained from Statistics Canada:", a("http://www.statcan.gc.ca/tables-tableaux/sum-som/l01/cst01/famil01-eng.htm", href="http://www.statcan.gc.ca/tables-tableaux/sum-som/l01/cst01/famil01-eng.htm"))
    )
  )
))