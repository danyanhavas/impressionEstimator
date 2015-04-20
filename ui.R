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
      
      radioButtons("lift", label = "Lift Threshold",
                   choices = list("1%","5%","10%","15%","20%"),
                   selected ="10%",inline=T),
      helpText("Example: choose 10% if you want to detect precision to 10%"),
      hr(),
      
      radioButtons("sif", label = "Confidence Level",
                   choices = list("80%","85%","90%","95%"),
                   selected = "90%",inline=T),
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