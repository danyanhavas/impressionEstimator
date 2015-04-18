# impressionEstimator
# 4/17/2015

# MG comments:
# remember user friendliness most important
# adjusted titles and naming for some fields
# let's change the selection of lift threshold and confidence to buttons
# buttons should be easier to use from UX perspective

shinyUI(fluidPage(
  titlePanel("impressionEstimator"),
  sidebarLayout(
    sidebarPanel(
      helpText("Choose the appropriate inputs for your test:"),
      
  numericInput("avgRR", label = "Average Response Rate", value = 0.05),
  helpText("Example: if your control has 5% CTR, enter 0.05"),
  hr(),
  # convert this to a button with 1%, 5%, 10%, 15%, 20%
  numericInput("lift", label = "Lift Threshold", value = 0.1),
  helpText("Example: choose 10% if you want to detect precision to 10%"),
  hr(),
  # convert this to a button with 80%, 85%, 90%, 95%
  numericInput("sif", label = "Confidence Level", value = 0.9),
  helpText("Example: select 90% for 90% confidence"),
  hr(),
  numericInput("num", label = "Number of Groups", value = 2),
  helpText("Note: this includes the control, so if you are testing 2 alternatives
           and 1 control, enter 3"),
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