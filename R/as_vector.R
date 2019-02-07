#' As vector
#'
#' Convert a one-column or one-row data.table to an unnamed vector.
#'
#' @param .x Object to convert.
#' @export
#' @rdname as_vector
#'
#' @examples
#' data.frame(x = 1:5) %>% as_vector
#' data.frame(a = 1, b = 2) %>% as_vector
as_vector <- function(.x) UseMethod("as_vector")

#' @export
#' @rdname as_vector
as_vector.default <- function(.x) as.vector(.x)

#' @export
#' @rdname as_vector
as_vector.list <- function(.x) {
  .x %>% unlist %>% unname
}

#' @export
#' @rdname as_vector
as_vector.data.frame <- function(.x) {
  .x %>% unlist %>% unname
}

#' @export
#' @rdname as_vector
as_vector.data.table <- function(.x) {
  .x %>% unlist %>% unname
}

# FIXME:
# What should be the correct behaviour in this cases?
# as_vector(c(a = factor(letters)))
# as_vector(iris[1, ])
