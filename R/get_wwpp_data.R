#' @title Get Weight Watchers Points data (Original)
#'
#' @description
#' Get data required to calculate points on Weight Watchers Points (Original)
#' system. See:
#' \url{http://calorielab.com/news/2015/10/08/weight-watchers-pointsplus-formula/}
#'
#' @param nutrition_data \code{data.frame} A food ID from the database
#'
#' @export
get_wwpp_data <- function(food_id) {
  nd <- get_nutrition_data(food_id)

  protein <- nd %>% dplyr::filter(Tagname == "PROCNT") %>% dplyr::pull(Nutr_Val)
  carbs <- nd %>% dplyr::filter(Tagname == "CHOCDF") %>% dplyr::pull(Nutr_Val)
  fat <- nd %>% dplyr::filter(Tagname == "FAT") %>% dplyr::pull(Nutr_Val)
  fiber <- nd %>% dplyr::filter(Tagname == "FIBTG") %>% dplyr::pull(Nutr_Val)

  c(protein, carbs, fat, fiber)
}
