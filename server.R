conversionrate <- function(givendate) {
  if (givendate == as.Date("2014-11-23")) {60}
  else if (givendate == as.Date("2014-11-22")) {60.15}
  else if (givendate == as.Date("2014-11-21")) {60}
  else if (givendate == as.Date("2014-11-20")) {59.8}
  else if (givendate == as.Date("2014-11-19")) {59.5}
  else if (givendate == as.Date("2014-11-18")) {59.7}
  else if (givendate == as.Date("2014-11-17")) {59.3}
  else if (givendate == as.Date("2014-11-16")) {59.5}
  else if (givendate == as.Date("2014-11-15")) {59.6}
  else if (givendate == as.Date("2014-11-14")) {60}
  else if (givendate == as.Date("2014-11-13")) {59.9}
  else if (givendate == as.Date("2014-11-12")) {60.05}
  else if (givendate == as.Date("2014-11-11")) {60.05}
  else if (givendate == as.Date("2014-11-10")) {60}
  else if (givendate == as.Date("2014-11-09")) {60.2}
  else if (givendate == as.Date("2014-11-08")) {60.4}
  else if (givendate == as.Date("2014-11-07")) {60.3}
  else if (givendate == as.Date("2014-11-06")) {60.2}
  else if (givendate == as.Date("2014-11-05")) {59.95}
  else if (givendate == as.Date("2014-11-04")) {59.8}
  else if (givendate == as.Date("2014-11-03")) {59.65}
  else if (givendate == as.Date("2014-11-02")) {59.45}
  else if (givendate == as.Date("2014-11-01")) {59.15}
  else {"Data not available for this date"}
}

conversionfee <- function(fee) {
  if (fee == "Yes") {10}
  else {0}
}

library(shiny)
shinyServer(
  function(input, output) {
    output$oamt <- renderText({input$amt})
    output$ofee <- renderText({input$submitButton 
                               isolate({conversionfee(input$fee)})})
    output$odate <- renderPrint({input$date})
    output$orate <- renderText({input$submitButton 
                                isolate({conversionrate(input$date)})})
    output$onet <- renderText({
      input$submitButton 
      isolate({as.numeric(input$amt)} * {as.numeric(conversionrate(input$date))} 
                             - {as.numeric(conversionfee(input$fee))})})
  }
  )