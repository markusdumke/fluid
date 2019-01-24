#' Safely convert to numeric
#'
#' @param .x Vector.
#'
#' @return Numeric vector of same length as `.x`.
#' @export
#'
#' @examples
#' as.numeric(factor("1.3"))
#' as_numeric(factor("1.3"))
as_numeric <- function(.x) {
  if (is.numeric(.x)) {
    return(.x)
  }
  if (length(.x) == 0) {
    return(numeric())
  }
  if (is.factor(.x)) {
    .x <- as.character(.x)
  }
  as.numeric(.x)
}
