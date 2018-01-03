#' @title Calculate Weight Watchers Points Plus
#'
#' @description
#' Calculate Weight Watchers Points Plus from a food_id, the result of
#' get_wwpp_data, or a set of inputs. See:
#' \url{http://calorielab.com/news/2015/10/08/weight-watchers-pointsplus-formula/}
#'
#' @param food_id \code{character(1)} A food ID from the database
#' @param wwpp_data \code{numeric} A vector of numbers with required data from \link{get_wwpp_data}
#' @param protein \code{numeric(1)} grams of protein
#' @param carbs \code{numeric(1)} grams of carbs
#' @param fat \code{numeric(1)} grams of fat
#' @param fiber \code{numeric(1)} grams of fiber
#'
#' @export
wwpp <- function(food_id = NULL, quantity = 1, wwpp_data = NULL, protein = NULL, carbs = NULL,
                          fat = NULL, fiber = NULL) {
  if (!is.null(food_id)) {
    wwpp_data <- get_wwpp_data(food_id)
  }

  if (!is.null(wwpp_data)) {
    protein <- wwpp_data[1]
    carbs <- wwpp_data[2]
    fat <- wwpp_data[3]
    fiber <- wwpp_data[4]
  }

  pp <- protein / 10.94 +
    carbs / 9.21 +
    fat / 3.89 -
    fiber/ 12.5

  pp
}
