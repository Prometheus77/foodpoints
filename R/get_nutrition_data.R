#' @title Get nutrition data from database
#'
#' @description
#' Given a food type and amount, provides nutrition information on that food
#'
#' @param food_id \code{integer(1)} Food ID number (NDB_No)
#' @param food_name \code{character(1)} String to match against short description (Shrt_Desc)
#' @param quantity \code{numeric(1)} Quantity of food
#' @param measure \code{character(1)} Measure to use for food. Will be converted from an available measure if possible.

get_nutrition_data <- function() {
  checkmate::assert_integer(food_id)
  checkmate::assert_character(food_name)
  checkmate::assert_numeric(quantity)
  checkmate::assert_character(measure)


}
