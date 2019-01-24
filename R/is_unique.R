#' Is a vector unique?
#'
#' @param .x A vector.
#'
#' @return Logical scalar.
#'
#' @export
#' @import data.table
#' @rdname is.unique
is.unique <- function(.x) {
  uniqueN(.x) == length(.x)
}

#' @export
#' @rdname is.unique
is_unique <- is.unique
