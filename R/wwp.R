#' @title Calculate Weight Watchers Points (original)
#'
#' @description
#' Calculate Weight Watchers Points (original) from a food_id, the result of
#' get_wwp_data, or a set of inputs. See:
#' \url{http://calorielab.com/news/2015/10/08/weight-watchers-pointsplus-formula/}
#'
#' @param food_id \code{character(1)} A food ID from the database
#' @param wwp_data \code{numeric} A vector of numbers with required data from \link{get_wwp_data}
#' @param calories \code{numeric(1)} calories in food (KCal)
#' @param fat \code{numeric(1)} grams of fat
#' @param fiber \code{numeric(1)} grams of fiber
#'
#' @export
wwp <- function(food_id = NULL, wwp_data = NULL, calories = NULL,
                 fat = NULL, fiber = NULL) {
  if (!is.null(food_id)) {
    wwp_data <- get_wwp_data(food_id)
  }

  if (!is.null(wwp_data)) {
    calories <- wwp_data[1]
    fat <- wwp_data[2]
    fiber <- wwp_data[3]
  }

  p <- calories / 50 +
    fat / 12 -
    fiber / 5

  p
}
