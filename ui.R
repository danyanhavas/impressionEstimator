# impressionEstimator
# 4/23/2015

# MG comments:
# adjusted some text to make clear
# fixed the example text
# change RR to have min and max

# TODO
# need to catch all errors into:
# "please reach out to Data Science team"

shinyUI(fluidPage(
  titlePanel("Impression Estimator"),
  fluidRow(
    column(3, wellPanel(
      h4("Choose the appropriate inputs for your test:"),
      numericInput("avgRR", label = "Average Response Rate", value = 0.05,
                   min = 0, max = 1, step=.0001),
      helpText("Enter the known RR of your control as a decimal. 
               Ex: if your control has a 5% CTR, enter 0.05"
      ),
      hr(),
      numericInput("num", label = "Number of Groups", value = 2),
      helpText("Enter the total number of groups in your test, 
               including the control group. Ex: if you're testing
               1 control vs 2 alternatives, enter 3"
      ),
      hr()
    )),
    
    column(4, wellPanel(  
      radioButtons("lift", label = "Lift Threshold",
                   choices = list("1%","5%","10%","15%","20%"),
                   selected ="10%",inline=T),
      helpText("Select the smallest lift we will be able to 
               detect as significant. Higher lift thresholds
               require less impressions."
      ),
      hr()
    )),
    
    column(4,wellPanel(
      radioButtons("sif", label = "Confidence Level",
                   choices = list("80%","85%","90%","95%"),
                   selected = "90%",inline=T),
      helpText("Select the desired confidence level. Higher confidence
               levels require more impressions."
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
                 helpText("We want to test the performance of a new text ad.
                          Our control text ad has a 5% CTR, and we want to
                          be able to detect a lift of at least 10% at 90%
                          confidence."),
                 br(),
                 helpText("Enter Response Rate: 5%"),
                 helpText("Enter number of groups: 2"),
                 helpText("Select lift threshold of 10%"),
                 helpText("Select confidence level of 90%"),
                 br(),
                 helpText("The number of observations in each group is: 24603")
        )
      )
      
      
    )
    )
))