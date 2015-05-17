library(shiny)
library(UsingR)

shinyServer(
        function(input, output) {
                
                output$newHist <- renderPlot({
                        # Get Inputs
                        set.seed(input$seed)
                        N <- input$N
                        range <- input$range
                        delta <- input$delta
                        valueToPredict <- input$valueToPredict
                       
                        # Generating Random Numbers From a Linear Model
                        x <- rnorm(N)
                        error <- rnorm(N, 0, 2.5) 
                        y <- 0.4 + 3*x + error 

                        # Running the Regression
                        model <- lm(y ~ x)
                        
                        # Graphics elements
                        plot(x, y, main="Linear Regression Solution vs. Arbitrary Straight Line")
                        abline(model, lwd=3, col="blue")
                        
                        # Constructing the dynamic line
                        a <- min(x) - 5
                        c <- max(x) + 5
                        b <- predict(model, newdata = data.frame(x = a))-delta
                        d <- predict(model, newdata = data.frame(x = c))+delta
                        
                        seqX <- seq(a, c, length.out = 1000)
                        seqY <- ( (d-b)*seqX + (c*b-a*d) ) / (c-a)
        
                        points(c(a, c), c(b,d), type='l', lwd=1, col="red")
                        
                        if (input$legend)
                        {
                                legend("bottomright",c("Linear Regression Solution","Arbitrary Straight Line"), lty=c(1,1), lwd=c(3,1),col=c("blue","red")) 
                        }
                        
                        vertical <- switch(input$vertical, l0 = 0, l1 = 1, l2 = 2, 0)
                        
                        if (vertical == 1) 
                        {       # Show Verticals to Arbitrary Line:
                                s <- seq(length(x))
                                indexClosest <- c()
                                for(i in s){ indexClosest <- c(indexClosest, which.min(abs(seqX - x[i])) ) }
                                segments(x[s], y[s], x[s], seqY[indexClosest], col= 'forestgreen')
                        }
               
                        if (vertical == 2) 
                        {       # Show Verticals to LR line:
                                s <- seq(length(x))
                                predicY <- predict(model, newdata = data.frame(x = x))
                                segments(x[s], y[s], x[s], predicY, col= 'forestgreen')
                        }
                        
                        # Value of y to Predict
                        isXvalueNA <- suppressWarnings(is.na(as.numeric(valueToPredict)))
                        if(!isXvalueNA)
                        {
                                xNumeric <- as.numeric(valueToPredict)
                                yPrediction <- predict(model, newdata = data.frame(x = xNumeric))
                                points(xNumeric, yPrediction, ,pch=18,cex=2,col="green")
                                arrows(xNumeric+0.3, yPrediction, xNumeric+0.05, yPrediction, length=0.1)
                                text(xNumeric+0.3, yPrediction, "Value \n Predicted")
                        }
                       
                        
                        })
                # Table
                distributionValues <- reactive({
                          
                        # Get Inputs
                        set.seed(input$seed)
                        N <- input$N
                        range <- input$range
                        delta <- input$delta
                        valueToPredict <- input$valueToPredict
                        
                        # Generating Random Numbers From a Linear Model
                        x <- rnorm(N)
                        error <- rnorm(N, 0, 2) 
                        y <- 0.5 + 2*x + error 
                        model <- lm(y ~ x)
                        
                        # Value of y to Predict
                        isXvalueNA <- suppressWarnings(is.na(as.numeric(valueToPredict)))
                        yPrediction <- ""
                        
                        if(isXvalueNA)
                        {
                                yPrediction <- "This is not a numeric value. Try again..."
                        }else
                        {
                                xNumeric <- as.numeric(valueToPredict)
                                yPrediction <- predict(model, newdata = data.frame(x = xNumeric))
                                yPrediction <- signif(yPrediction, digits=4)
                        }
                        
                        # Residual Error Arbitrary Line
                        a <- min(x) - 5
                        c <- max(x) + 5
                        b <- predict(model, newdata = data.frame(x = a))-delta
                        d <- predict(model, newdata = data.frame(x = c))+delta
                        
                        seqX <- seq(a, c, length.out = 1000)
                        seqY <- ( (d-b)*seqX + (c*b-a*d) ) / (c-a)
                        s <- seq(length(x))
                        indexClosest <- c()
                        residAuxiliar <- 0
                        for(i in s)
                        { 
                                indexClosest <- c(indexClosest, which.min(abs(seqX - x[i])) ) 
                                residAuxiliar <- residAuxiliar + (seqY[indexClosest[i]]-y[i])^2
                        }
                        resArbitrary <- sqrt(residAuxiliar / (N - 2))
                        
                        # Get Statistics
                        fstatistic <- summary(model)[[10]][[1]]
                        p1 <- summary(model)[[4]][[8]]
                        resLM <- summary(model)$sigma 
                        
                        # Compose data frame
                        data.frame(Resume = c("Correlation (x,y)", 
                                            "Covariance (x,y)",
                                            "Residual Linear Model",
                                            "Residual Arbitrary Line",
                                            "Prediction of Y"),
                                   
                                   Values = as.character(c( signif(cor(x,y), digits=4), 
                                                          signif(cov(x,y), digits=4), 
                                                          signif(resLM, digits=4),
                                                          signif(resArbitrary, digits=4),
                                                          yPrediction),
                                   stringsAsFactors=FALSE))
      
                })
                
                # Show the table
                output$resume <- renderTable({
                        distributionValues()
                })

})
