#' Sequence along rows or columns
#'
#' @param .Data (data.frame or data.table)
#'
#' @return Vector with length of `NROW(.Data)` or `NCOL(.Data)`.
#'
#' @export
#' @seealso [base::seq]
#' @rdname sequence_generation
#'
#' @examples
#' seq_row(iris)
#' seq_col(iris)
seq_row <- function(.Data) {
  seq_len(NROW(.Data))
}

#' @rdname sequence_generation
#' @export
seq_col <- function(.Data) {
  seq_len(NCOL(.Data))
}
