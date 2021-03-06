#' @title Find food in database
#'
#' @description
#' Given a character string, search for a match in the database
#'
#' @param food \code{character(1)} Food name to search for
#' @param return_type \code{character(1)} What to return? Options are:
#' \itemize{
#'   \item \code{'all'} Return all matches (default)
#'   \item \code{'first'} Return first match
#' }
#' @param case_sens \code{logical(1)} Case sensitive search? Default is FALSE
#' @param view \code{logical(1)} Render result with View()? Default is TRUE
#'
#' @export
find_food <- function(food, return_type = 'all', case_sens = FALSE, view = TRUE) {
  checkmate::assert_string(food)
  checkmate::assert_choice(return_type, c("first", "all"))

  res <- grep(toupper(food), list_food_names())
  if (return_type == "first") res <- res[1]
  food_list <- food_db$food_des[res, ]
  if (view == TRUE) {
    return(View(food_list))
  } else {
    return(food_list)
  }
}
