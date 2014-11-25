library(shiny)
shinyUI (pageWithSidebar (
  headerPanel("Currency Converter"), 
  sidebarPanel(h3("How many dollars do you want to convert?"),
               numericInput("amt", "Enter Amount (USD)", 1, 0),
               dateInput("date", "As on Date"),
               radioButtons("fee", "Currency Conversion Fee Applicable",
                                  c("Yes", "No")),
               actionButton("submitButton", "Calculate Amount")),
  mainPanel(h3("Conversion Rate and Output"),
            h4("Amount Entered"),
            verbatimTextOutput("oamt"),
            h4("Conversion Date"),
            verbatimTextOutput("odate"),
            h4("Conversion Rate"),
            verbatimTextOutput("orate"),
            h4("Currency Conversion Fee"),
            verbatimTextOutput("ofee"),
            h4("Net Amount (INR)"),
            verbatimTextOutput("onet"),
  p("Documentation:",a("Currency Converter",href="Documentation.html")))
  ))