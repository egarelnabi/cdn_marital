# server.R

library(rCharts)

demographic <- read.csv('Canada_Demographic.csv')

options(RCHART_WIDTH = 500)

shinyServer(function(input, output) {
  output$lexplot <- renderChart2({
    selected <- input$Status
    Status <- subset(demographic, Status == selected & Year %in% seq(input$range[1], input$range[2], 1))
    demographPlot <- hPlot(
      x = "Year", 
      y = "Number", 
      group = "Gender", 
      data = Status, 
      type = "spline")
    
    demographPlot$yAxis(title = list(enabled = TRUE, text = 'Number_of_People'), 
                      labels = list(rotation = -0, align = 'right'), 
                      replace = T)
    demographPlot$xAxis(title = list(enabled = TRUE, text = 'Year'), labels = list(rotation = -30, align = 'right'), replace = T)
    demographPlot$exporting(enabled = F)
    return(demographPlot)
  })
})