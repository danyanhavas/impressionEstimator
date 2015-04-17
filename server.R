shinyServer(
  function(input, output) {    
    
    output$text1 <- renderText({ 
     "The number of observations in each group is "
    })
    
    output$value1<-renderPrint({
      
      ceiling(power.prop.test(p1=input$avgRR,p2=input$avgRR*(1+input$lift),sig.level=1-input$sif, 
                      power=0.8)[[1]])
    })
    
    output$text2 <- renderText({ 
      "The total number of observations you need is "
    })
    
    output$value2<-renderPrint({
    input$num*ceiling(power.prop.test(p1=input$avgRR,p2=input$avgRR*(1+input$lift),sig.level=1-input$sif, 
                                      power=0.8)[[1]])
  })
})

