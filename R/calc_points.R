#' @title Calculate points in food
#'
#' @description
#' Calculates points of a given quantity of food
#'
#' @param food_id \code{character} Food ID in database.
#' @param quantity \code{numeric(1)} Quantity of food. Default is 100.
#' @param measure \code{character(1)} Measure to use for food. Available measures are:
#' \itemize{
#'   \item \code{'g'} grams (default)
#'   \item \code{'kg'} kilograms
#'   \item \code{'oz'} ounces
#'   \item \code{'lb'} pounds
#'   \item \code{'l'} liters
#'   \item \code{'ml'} mililiters
#'   \item \code{'c'} cups
#'   \item \code{'pt'} pints
#'   \item \code{'qt'} quarts
#'   \item \code{'gal'} gallons
#' }
#' @param density \code{numeric(1)} Density to use for volume-to-mass
#'   conversions in grams per mililiter. Default is 1 g / ml, or the density of
#'   water.
#' @param point_system \code{character} Points system to use: \code{'wwp'} for
#'   Weight Watchers Points, \code{'wwpp'} for Weight Watchers Points Plus. Default
#'   is \code{'wwpp'}.
#' @param decimals \code{numeric(1)} Number of decimal places to show. Defaults
#'   is 0.
#' @export
calc_points <- function(food_id, quantity = 100, measure = "g", density = 1, point_system = "wwpp",
                        decimals = 0) {
  checkmate::assert_string(food_id)
  checkmate::assert_choice(point_system, c("wwpp", "wwp"))
  checkmate::assert_number(quantity, lower = 0)
  checkmate::assert_choice(measure, c("g", "kg", "oz", "lb", "l", "ml", "c", "pt", "qt", "gal"))
  checkmate::assert_number(density, lower = 0)

  if (point_system == "wwpp") {
    p <- wwpp(food_id)
  } else {
    p <- wwp(food_id)
  }

  if (measure == "g") {
    mult <- quantity / 100
  } else if (measure == "kg") {
    mult <- quantity / 0.1
  } else if (measure == "oz") {
    mult <- quantity / 3.5274
  } else if (measure == "lb") {
    mult <- quantity / 0.22046
  } else if (measure == "l") {
    mult <- density * quantity / 10
  } else if (measure == "ml") {
    mult <- density * quantity * 100
  } else if (measure == "c") {
    mult <- density * quantity / 2.36
  } else if (measure == "pt") {
    mult <- density * quantity / 4.73
  } else if (measure == "qt") {
    mult <- density * quantity / 9.46
  } else if (measure == "gal") {
    mult <- density * quantity / 37.85
  }

  round(p * mult, decimals)
}
