#' Convert empty string and "NA" to NA
#'
#' @param .x Character vector.
#'
#' @return Vector of same length as `.x`.
#'
#' @examples
#' empty_string_to_na(c("a", "", "NA", "b"))
empty_string_to_na <- function(.x) {
  .x[.x == ""] <- NA_character_
  .x[.x == "NA"] <- NA_character_
  .x
}
