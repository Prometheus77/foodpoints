#' @title Food database.
#'
#' @description
#' Database used as source for nutrition information, from USDA's Survey SR 2013-2014.
#'
#' @format A list consisting of four 'tibbles'
#' \describe{
#'   \item {food_des} Contains a key, a long description, and short description
#'   for each food item in the database
#'   \item {nut_data} Contains the actual nutritional data that forms the core
#'   of the database
#'   \item {nutr_def} Contains metadata on nutrition information including units
#'   and nutrient types
#'   \item {src_cd} Source codes describing where each data point came from
#' }
#'
#' @source: \url{https://www.ars.usda.gov/northeast-area/beltsville-md/beltsville-human-nutrition-research-center/nutrient-data-laboratory/docs/usda-national-nutrient-database-for-standard-reference-dataset-for-what-we-eat-in-america-nhanes-survey-sr/}
"food_db"
