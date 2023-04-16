# Load packages
library(shiny)
library(tidyverse)
library(nycflights13)

# Mean function for a collection with NAs
fmean <- function(x) mean(x[[1]], na.rm = TRUE)

### Cleaning data ###
# Mean function for a collection with NAs
fmean <- function(x) mean(x[[1]], na.rm = TRUE)

# Convert data types and pivot wider
gdata <- flights %>% 
  select(c("month", "origin", "dep_delay", "arr_delay")) %>%
  mutate(month = factor(month),
         dep_delay = as.double(dep_delay)) %>% 
  group_by(origin, month) %>%
  pivot_wider(names_from = c("month"),
              values_from = c("dep_delay", "arr_delay")) %>% 
  ungroup()

# Find mean delays
for (i in 1:3){
  for (j in 2:25){
    gdata[[i,j]] = list(fmean(gdata[[i,j]]))
  }
}

# Pivot longer and separate columns
flights_clean <- gdata %>% 
  pivot_longer(cols = c(2:25),
               names_to = c("dep_arr_m"),
               names_prefix = "_delay") %>% 
  separate(col = dep_arr_m,
           into = c("type", "month"),
           sep = "_delay_") %>% 
  mutate(value = as.double(value),
         month = as.integer(month)) %>% 
  arrange(month) %>% 
  mutate(month = factor(month))

### End cleaning ###


# UI
ui <- fluidPage(
  # App title
  titlePanel("NYC Flight Delays by Airport", windowTitle = "NYC Flight Delays"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        selectInput("origin", h3("Origin Airport"),
                  choice = list("EWR",
                                "JFK",
                                "LGA"),
                  selected = "EWR")
        ),
      fluidRow(
      radioButtons("dep_arr", h3("Delay Type"),
                   choices = list("Departure Delays"="dep",
                                  "Arrival Delays"="arr"),
                   selected = "dep")
      )
    ),
    
    mainPanel(
      fluidRow(textOutput("selection")),
      fluidRow(plotOutput("plot"))
    )
  )
)


# Backend
server <- function(input, output){
  # Display user selection
  output$selection <- renderText({
    paste("You have selected:\t", input$origin, "---", input$dep_arr)
  })
  
  # Plot
  output$plot <- renderPlot({
    flights_clean %>%
      filter(origin==input$origin & type==input$dep_arr) %>%
      select(c(month, value)) %>%
      ggplot(mapping = aes(x=month, y=value)) +
      geom_bar(stat = "identity", fill="pink") +
      labs(x = "Month",
           y = "Average delay (minutes)",
           title = paste(input$dep_arr, "at", input$origin, "by month"))
  })
}

shinyApp(ui = ui, server = server)