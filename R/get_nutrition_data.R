#' @title Get nutrition data from database
#'
#' @description
#' Given a food type and amount, provides nutrition information on that food
#'
#' @param food_id \code{integer(1)} Food ID number (NDB_No)
#'
#' @export
get_nutrition_data <- function(food_id) {
  checkmate::assert_string(food_id)

  food_db$nut_data %>%
    dplyr::filter(NDB_No == food_id) %>%
    dplyr::left_join(food_db$nutr_def, by = "Nutr_No") %>%
    dplyr::select(Tagname, NutrDesc, Nutr_Val, Units)
}
