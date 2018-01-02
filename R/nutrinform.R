#' @title Provide nutrition information
#'
#' @description
#' Given a food type and amount, provides nutrition information on that food using
#' USDA's Survey SR 2013-2014 database.\cr
#' Link: \link{https://www.ars.usda.gov/northeast-area/beltsville-md/beltsville-human-nutrition-research-center/nutrient-data-laboratory/docs/usda-national-nutrient-database-for-standard-reference-dataset-for-what-we-eat-in-america-nhanes-survey-sr/}
#'
#' @param food_id \code{integer(1)} Food ID number (NDB_No)
#' @param food_name \code{character(1)} String to match against short description (Shrt_Desc)
#' @param quantity \code{numeric(1)} Quantity of food
#' @param measure \code{character(1)} Measure to use for food. Will be converted from an available measure if possible.

nutrinform <- function() {
  checkmate::assert_integer(food_id)
  checkmate::assert_character(food_name)
  checkmate::assert_numeric(quantity)
  checkmate::assert_character(measure)


}
