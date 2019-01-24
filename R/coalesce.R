#' Coalesce vectors.
#'
#' @param ... Vectors of same length.
#'
#' Copied from [Stackoverflow](https://stackoverflow.com/questions/19253820/how-to-implement-coalesce-efficiently-in-r).
#'
#' @return Vector of same length as input vectors.
#' @export
#'
#' @examples
#' coalesce(c(NA, 1, NA), c(2, NA, NA))
coalesce <- function(...) {
  Reduce(function(x, y) {
    i <- which(is.na(x))
    x[i] <- y[i]
    x},
    list(...))
}
