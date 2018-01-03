#' @title List food names.
#'
#' @description
#' Create a vector with the names of all avialable foods, to be used for partial matches
#'
#' @param desc_type \code{character(1)} Description type to use, 'long' or 'short'. Default is 'short'.
#'
#' @export
list_food_names <- function(desc_type = "short") {
  checkmate::assert_choice(desc_type, c("long", "short"))

  if (desc_type == "short") return(food_db$food_des[["Shrt_Desc"]])
  if (desc_type == "long") return(food_db$food_des[["Long_Desc"]])
}
