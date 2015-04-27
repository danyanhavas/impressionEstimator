# catch all errors to force users to consult with us
# TODO: 
# add suggestions on how to fix common errors
# catch NA values
tryIE <- function(code, silent=F){
  tryCatch(code, error = function(c) 'Error: Please consult with Data Science team',
           warning = function(c) 'Error: Please consult with Data Science team',
           message = function(c) 'Error: Please consult with Data Science team')
  }


shinyServer(
  function(input, output) {    
    
    numlift<-reactive({
      switch(input$lift,"1%"=0.01,"5%" =0.05,
             "10%" = 0.10,"15%"=0.15,"20%"=0.20)
    })
    numsif<-reactive({
      switch(input$sif,"80%"=0.80,"85%" =0.85,
             "90%" = 0.90,"95%"=0.95)
    })
    
    number<-reactive({ceiling(power.prop.test(p1=input$avgRR,p2=input$avgRR*(1+numlift()),sig.level=1-numsif(), 
                                              power=0.8)[[1]])
    })
    
    output$liftText <- renderText({
      paste('We can only detect a difference if the new response rate is', 
            as.character(input$avgRR*(1+numlift())),'or higher.'
      )
    })
    
    output$text1 <- renderText({ 
      "The number of observations in each group is "
    })
    
    output$value1<-renderText({
     
      tryIE(number())
    })
    
    output$text2 <- renderText({ 
      "The total number of observations you need is "
    })
    
    output$value2<-renderText({

      tryIE(number()*input$num)
      
    })
    
    
  })

