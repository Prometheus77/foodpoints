ui <- shiny::fluidPage(
  titlePanel("Food points calculator"),
  sidebarLayout(
    sidebarPanel(
      textInput("food_name", "Food name"),
      sliderInput("page", "Results page", min = 1, max = 20, value = 1, step = 1),
      textInput("food_id", "Food ID"),
      radioButtons("point_system", "Point System",
                   choices = c("Points Plus", "Original Points"),
                   selected = "Points Plus"),
      numericInput("quantity", "Quantity", value = 100),
      selectInput("measure", "Measure",
                  choices = c("g", "kg", "oz", "lb", "l", "ml", "c", "pt", "qt", "gal"),
                  selected = "g"),
      numericInput("density", "Density (g/ml)", value = 1),
      sliderInput("decimals", "Decimals", min = 0, max = 4, value = 0, step = 1)
    ),
    mainPanel(
      tableOutput("search_results"),
      br(),
      textOutput("points"),
      br(),
      tableOutput("nutrition_data")
      )
  )
)
server <- function(input, output) {
  output$search_results <- renderTable({
    find_food(input$food_name, view = FALSE)[seq(from = input$page, to = input$page + 4), ]
  })

  output$points <- renderText({
    if (!is.null(input$food_id)) {
      p <- calc_points(input$food_id,
                  quantity = input$quantity,
                  measure = input$measure,
                  density = input$density,
                  decimals = input$decimals)
      paste0("Points: ", p)
    }
  })

  output$nutrition_data <- renderTable({
    if (input$point_system == "wwpp") {
      value <- get_wwp_data(input$food_id)
      measure <- c("Calories", "Fat (g)", "Fiber (g)")
    } else {
      value <- get_wwpp_data(input$food_id)
      measure <- c("Protein (g)", "Carbs (g)", "Fat (g)", "Fiber (g)")
    }
    data.frame(value, measure)
  })

}
shiny::shinyApp(ui = ui, server = server)
