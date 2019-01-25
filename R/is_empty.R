#' Is input empty or falsy?
#'
#' Functions to check if inputs are NULL, zero length, "", 0 or FALSE.
#' Useful to check if an input inside a shiny app is empty.
#'
#' @param .x An object.
#'
#' @return Logical value.
#' @export
#' @rdname is_empty
#' @examples
#' is_empty(NULL)
#' is_empty(character(0))
#'
#' is_empty_or_false(FALSE)
#' is_empty_or_zero(0)
#' is_empty_or_na(NA)
#' is_empty_character("")
is_input_empty <- function(.x) {
  if (is.null(.x)) return(TRUE)
  if (length(.x) == 0L) return(TRUE)
  if (.x == "") return(TRUE)
  if (isFALSE(.x)) return(TRUE)
  return(FALSE)
}

#' @export
#' @rdname is_empty
is_empty <- function(.x) {
  purrr::is_empty(.x)
}

#' @export
#' @rdname is_empty
is_empty_character <- function(.x) {
  purrr::is_empty(.x) || .x == ""
}

#' @export
#' @rdname is_empty
is_empty_or_zero <- function(.x) {
  purrr::is_empty(.x) || .x == 0L
}

#' @export
#' @rdname is_empty
is_empty_or_false <- function(.x) {
  purrr::is_empty(.x) || isFALSE(.x)
}

#' @export
#' @rdname is_empty
is_empty_or_na <- function(.x) {
  purrr::is_empty(.x) || is.na(.x)
}
