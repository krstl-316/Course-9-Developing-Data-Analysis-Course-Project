# Course9_Developing_Data_Products_Course_Project
# Auther: Jingchen Huyan

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Check your Body Mass Index(BMI) !"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          h4("BMI Calculator:"),
          em("(For adult only)"),
          br(),
          textInput("name", "What shall I call you: "),
          sliderInput("height", 
                      label = "Height (cm)", 
                      value = 168, 
                      min = 40, 
                      max = 250),
          sliderInput("weight", 
                      label = "Weight (kg)", 
                      value = 55, 
                      min = 20, 
                      max = 150),
          radioButtons("rd","Sex",c("Male"="Male",  
                                       "Famale"="Famale")),
          h6("You will get more personalised information based on whether you are male or female."),
          submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          p(h5("Welcome to my web to check your Body Mass Index(BMI)!"),
            h5("BMI can be used for population assessment of overweight and obesity."),
            h5(" Please enter your information to get a personalized suggestion."), sep="\n"),
          h4(textOutput("name")),
          p(h4("Based on your input, your BMI is:")),
          textOutput("bmi"),
          br(),
          p(h4("The status of your BMI is:")),
          htmlOutput("status"),
          br(),
          p(h4("The suggestion is:")),
          htmlOutput("suggestion"),
          br(),
          p(h4("Other suggestion:")),
          htmlOutput("other"),
          em(h6("Suggestions are just for completing the Course Project, not for professional purpose. "))
))))
