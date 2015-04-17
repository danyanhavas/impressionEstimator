shinyUI(fluidPage(
  titlePanel("PowerPropTest"),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose your inputs for power prop test."),
      
  # make number input boxes into the UI.
  numericInput("avgRR", label = "Average Response Rate", value = 0.05),
  helpText("Note: 0.05 represents for 5% CTR"),
  hr(),
  numericInput("lift", label = "Lift", value = 0.1),
  helpText("Note: 0.1 represents for 10% lift"),
  hr(),
  numericInput("sif", label = "Siglificance Level", value = 0.9),
  helpText("Note: 0.9 represents for 90% confidence"),
  hr(),
  numericInput("num", label = "Number of Groups", value = 2),
  helpText("Note: 2 represents for 2 groups in total including control group"),
  hr()
),
mainPanel(
  textOutput("text1"),
  verbatimTextOutput("value1"),
  textOutput("text2"),
  verbatimTextOutput("value2")
)
)
))