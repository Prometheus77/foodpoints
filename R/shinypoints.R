#' @export
shinypoints <- function() {
  app_dir <- system.file("shiny", "shinypoints", package = "foodpoints")
  if (app_dir == "") {
    stop("Could not find shiny app directory. Try reinstalling `foodpoints`.", call. = FALSE)
  }

  shiny::runApp(app_dir, display.mode = "normal")
}
