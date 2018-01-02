#' @title Display flat file
#'
#' @description
#' Creates a flat file with all the information in the food database for easy reference
#'
#' @export
display_flat_file <- function() {
  food_db$nut_data %>%
    left_join(food_db$food_des, by = 'NDB_No') %>%
    left_join(food_db$nutr_def, by = 'Nutr_No') %>%
    left_join(food_db$src_cd, by = 'Src_Cd')
}
