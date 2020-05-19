# Course9_Developing_Data_Products_Course_Project
# Auther: Jingchen Huyan


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  # Input Data
  output$bmi <- reactive({  
    bmi <- input$weight/( (input$height/100) * (input$height/100))
    bmi <- round(bmi, digits = 1)
  })
  
  output$name <- renderText({
    paste("Dear ", input$name, ":")
    })

  
  # results table
  #output$tabledata <- renderTable({
   # if (input$submit) { 
    #  isolate(datasetInput()) 
    #} 
#  })
  
  # status
  output$status <- renderText({
    if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) < 18.5) {
      paste("<span style=\"color:red\">Underweight</span>")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=18.5 & round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) <25) {
      paste("<span style=\"color:green\">Normal or Healthy Weight</span>")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=25 & round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) <30) {
      paste("<span style=\"color:orange\">Overweight</span>")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=30) {
      paste("<span style=\"color:red\">Obese</span>")
    }
  })
  
  
  # suggestions
  output$suggestion <- renderText({
    if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) < 18.5) {
      paste("<span style=\"color:red\">If you are receiving treatment for an eating disorder then this tool is NOT to be used. There may be an underlying medical cause for your weight, or your diet may not be providing you with enough calories. We suggest you discuss this with your GP.</span>")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=18.5 & round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) <25) {
      paste("<span style=\"color:green\">You are in the healthy weight range. Keep an eye on your weight and try to stay in the healthy range.</span> ")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=25 & round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) <30) {
      paste("<span style=\"color:orange\">Gradually losing less than 5% of your weight will significantly reduce your risk of health problems. If you're concerned about your weight speak to your GP.</span>")
    }
    else if (round(input$weight/( (input$height/100) * (input$height/100)), digits = 1) >=30) {
      paste("<span style=\"color:red\">Losing and keeping off your weight can have health benefits, such as lowering your blood pressure and reducing your risk of developing type 2 diabetes. You should work towards achieving a healthier weight over time. We suggest you visit your GP to discuss.</span>")
    }
  })
  
  # other
  output$other <- renderText({
    if(input$rd=="Male"){
      paste(h5("1.An athletic adult with with a lot of muscle may have a high BMI but not be overweight. This is because BMI can't tell the difference between fat and muscle."), 
            h5("2.Older adults can have a healthy BMI but still have too much fat. This is because older adults tend to have more body fat than younger adults."),
            sep="\n")
    }
    else {
      paste(h5("1.An athletic adult with with a lot of muscle may have a high BMI but not be overweight. This is because BMI can't tell the difference between fat and muscle."), 
               h5("2.Older adults can have a healthy BMI but still have too much fat. This is because older adults tend to have more body fat than younger adults."),
                  h5("3.Women can have a healthy BMI but still have too much fat. This is because women tend to have more body fat than men with the same BMI."), 
            h6("* If you are pregnant, you should use your pre-pregnancy weight to work out your BMI. Using your pregnancy weight may not be accurate."),
            sep="\n")
    }
  })
  
})