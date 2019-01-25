#' Capture side effects
#'
#' These functions are equivalent to their purrr equivalents, but actually
#' run the code instead of returning a function.
#'
#' @param .expression R Code which can be run.
#' @param ... Arguments passed on to [purrr::safely()] or [purrr::possibly()][purrr::safely()].
#' @param .otherwise Default value to use when an error occurs.
#'
#' @return
#'   `safe`: Returns a list with
#'   components `result` and `error`. One value is always `NULL`.
#'
#'   `quiet`: Returns a list with components
#'   `result`, `output`, `messages` and `warnings`.
#'
#'   `possible`: Uses a default value (`.otherwise`)
#'    whenever an error occurs.
#'
#' @export
#' @rdname possible
#' @seealso [purrr::safely()]
#' @examples
#' safe(log(10))
#' safe(log("a"))
#'
#' possible(log(10), NA)
#' possible(log("e"), NA)
#'
#' quiet(log(10))
#' quiet(log("a"))
possible <- function(.expression, .otherwise, ...) {
  f_possibly <- purrr::possibly(~ .expression, otherwise = .otherwise, ...)
  f_possibly()
}

#' @rdname possible
#' @export
safe <- function(.expression, ...) {
  f_safely <- purrr::safely(~ .expression, ...)
  f_safely()
}

#' @rdname possible
#' @export
quiet <- function(.expression) {
  f_safely <- purrr::quietly(~ .expression)
  f_safely()
}
