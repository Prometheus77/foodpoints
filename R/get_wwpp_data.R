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

  protein <- nd %>% filter(Tagname == "PROCNT") %>% pull(Nutr_Val)
  carbs <- nd %>% filter(Tagname == "CHOCDF") %>% pull(Nutr_Val)
  fat <- nd %>% filter(Tagname == "FAT") %>% pull(Nutr_Val)
  fiber <- nd %>% filter(Tagname == "FIBTG") %>% pull(Nutr_Val)

  c(protein, carbs, fat, fiber)
}
