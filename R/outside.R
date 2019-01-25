#' Inside / Outside
#'
#' @param .x Vector to test.
#' @param .y Vector or list of length 2.
#'        The first element is interpreted as the lower bound,
#'        the second element as the upper limit.
#'
#' @return A logical vector of the same length as `.x`.
#'
#' @export
#' @import data.table
#' @rdname outside
#'
#' @examples
#' 1 %outside% c(2, 5)
#' 1 %inside% c(2, 5)
`%outside%` <- function(.x, .y) {
  !(.x %between% .y)
}

#' @rdname outside
#' @export
#' @import data.table
`%inside%` <- function(.x, .y) {
  .x %between% .y
}
