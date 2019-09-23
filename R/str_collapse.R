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
str_collapse <- function(.x, .collapse = "") {
  stringr::str_c(.x, collapse = .collapse)
}

#' Keep / discard strings based on pattern
#'
#' @param .x A character vector to collapse.
#' @param .pattern A character value. Pattern to look for.
#'
#' @return A character vector.
#' @export
#' @rdname str_keep
#'
#' @examples
#' fruit <- c("apple", "banana", "pear", "pinapple")
#' str_keep(fruit, "apple")
#' str_discard(fruit, "apple")
str_discard <- function(.x, .pattern) {
  .x[!stringr::str_detect(.x, .pattern)]
}

#' @export
#' @rdname str_keep
str_keep <- function(.x, .pattern) {
  .x[stringr::str_detect(.x, .pattern)]
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


#' Concatenate strings
#'
#' Infix operator for paste0.
#'
#' @param .x A character value.
#' @param .y A character value
#'
#' @return A character pasted together from .x and .y.
#' @export
#'
#' @examples
#' "Pasting " %s% "strings"
`%s%` <- function(.x, .y){
  paste0(.x, .y)
}

