# impressionEstimator
# 4/17/2015

# MG comments:
# remember user friendliness most important
# adjusted titles and naming for some fields
# let's change the selection of lift threshold and confidence to buttons
# buttons should be easier to use from UX perspective

shinyUI(fluidPage(
  titlePanel("impressionEstimator"),
  fluidRow(
    column(3, wellPanel(
      h4("Choose the appropriate inputs for your test:"),
      numericInput("avgRR", label = "Average Response Rate", value = 0.05),
      helpText("Note: give the known value of your control group, 
               e.g.current coversion rate, CTR"
               #               "Example: if your control has 5% CTR, enter 0.05"
      ),
      hr(),
      numericInput("num", label = "Number of Groups", value = 2),
      helpText("Note: the total number of groups in your test, 
               including the control group" 
               #     "Example: if you are testing 2 alternative and 1 control, enter 3"
      ),
      hr()
    )),
    
    column(4, wellPanel(  
      radioButtons("lift", label = "Lift Threshold",
                   choices = list("1%","5%","10%","15%","20%"),
                   selected ="10%",inline=T),
      helpText("Note: the smallest effect you want to detect in your test"
               #        "Example: choose 10% if you want to detect a 10% precision in CTR"
      ),
      hr()
    )),
    
    column(4,wellPanel(
      radioButtons("sif", label = "Confidence Level",
                   choices = list("80%","85%","90%","95%"),
                   selected = "90%",inline=T),
      helpText("Note: how much confidence you have for your test"
               #     "Example: select 90% for 90% confidence"
      ),
      hr()
    )),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Results",
                 br(),
                 textOutput("text1"),
                 verbatimTextOutput("value1"),
                 textOutput("text2"),
                 verbatimTextOutput("value2")
        ),
        tabPanel("Example",
                 br(),
                 helpText("For example, to compute the sample size needed to 
                          pickup a 10% increase in click_through rate 
                          at a 95% confidence level and power of test 80%:"),
                 br(),
                 helpText("Click_through rate in the control group: 5%"),
                 helpText("Click_through rate in the test group: 5%*(1+10%)"),
                 helpText("Average Response Rate=0.05"),
                 helpText("Number of groups=2"),
                 helpText("Lift Threshold=10%"),
                 helpText("Confidence Level=95%"),
                 br(),
                 helpText("The number of observations in each group is: 31234")
        )
      )
      
      
    )
    )
))