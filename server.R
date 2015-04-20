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
    
    output$text1 <- renderText({ 
      "The number of observations in each group is "
    })
    
    output$value1<-renderPrint({
      
      ceiling(power.prop.test(p1=input$avgRR,p2=input$avgRR*(1+numlift()),sig.level=1-numsif(), 
                              power=0.8)[[1]])
    })
    
    output$text2 <- renderText({ 
      "The total number of observations you need is "
    })
    
    output$value2<-renderPrint({
      input$num*ceiling(power.prop.test(p1=input$avgRR,p2=input$avgRR*(1+numlift()),sig.level=1-numsif(), 
                                        power=0.8)[[1]])
    })
    
    
  })

