#' @title Get nutrition measures
#'
#' @description
#' Given a food type (NDB_No), return appropriate nutrition measures
#'
#' @param id \code{character(1)} The NDB_No of a food
#'
#' @export
get_nutrition_measures <- function(id) {
  checkmate::assert_string(id, pattern = "[:digits{5}:]")
}
