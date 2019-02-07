#' Collapse strings into one.
#'
#' @param .x A character vector to collapse.
#' @param .collapse A separator string to be inserted between the elements of `.x`.
#'
#' @return A character vector of length 1.
#' @export
#'
#' @examples
#' str_collapse(letters, ",")
str_collapse <- function(.x, .collapse = ",") {
  stringr::str_c(.x, collapse = .collapse)
}


#' Split string into a vector.
#'
#' Similar to [stringr::str_split()], but returns a character vector,
#' instead of a list or matrix.
#'
#' @param .x A character scalar to split.
#' @param .pattern A pattern to apply the split.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' str_split_v(c("a,b,c"), ",")
str_split_v <- function(.x, .pattern) {
  stringr::str_split(.x, pattern = .pattern, simplify = TRUE) %>% as.vector
}
