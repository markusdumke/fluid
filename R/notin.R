#' Value Matching
#'
#' Opposite of `%in%`.
#' `%notin%` returns `TRUE` if there is no match between `.x` and `.table`.
#'
#' @param .x Vector. Values to be matched.
#' @param .y Vector. Values to be matched against.
#'
#' @return A logical vector of the same length as `.x`.
#'
#' @export
#' @rdname like
#'
#' @examples
#' 1 %in% 1:3
#' 1 %notin% 1:3
#' "a" %notin% c("b", "c")
`%notin%` <- function(.x, .y) {
  match(.x, .y, nomatch = 0) < 1
}

#' Like and Unlike
#' @export
#' @import data.table
#' @rdname like
`%unlike%` <- function(.x, .y) {
  !(.x %like% .y)
}

#' Extractor functions
#' @export
#' @import data.table
#' @rdname like
#' @examples
#' library(data.table)
#' names(iris) %like% "Length"
#' names(iris) %xlike% "Length"
#' names(iris) %unlike% "Length"
#' names(iris) %setdiff% c("Species", "x")
`%xlike%` <- function(.x, .y) {
  .x[.x %like% .y]
}

#' Setdiff
#' @export
#' @rdname like
`%setdiff%` <- function(.x, .y) {
  setdiff(.x, .y)
}
