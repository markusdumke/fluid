#' Generate matrices
#'
#' Quick and easy generation of matrices.
#' Inspired by numpy.zeros etc.
#'
#' * `zeros` will create a matrix with all values 0L.
#' * `ones` will create a matrix with all values 1L.
#' * `random` will create a matrix with all values randomly uniform.
#'
#' @param .nrow Integer scalar. Number of rows.
#' @param .ncol Integer scalar. Number of columns. If missing will default to
#'              the number of rows, i.e. a symmetrical matrix is created.
#'
#' @rdname matrices
#' @export
#'
#' @examples
#' zeros(4)
#' ones(3, 5)
#' random(5)
zeros <- function(.nrow, .ncol) {
  if (missing(.ncol))
    .ncol <- .nrow
  matrix(0L, nrow = .nrow, ncol = .ncol)
}

#' @rdname matrices
#' @export
ones <- function(.nrow, .ncol) {
  if (missing(.ncol))
    .ncol <- .nrow
  matrix(1L, nrow = .nrow, ncol = .ncol)
}

#' @rdname matrices
#' @export
random <- function(.nrow, .ncol) {
  if (missing(.ncol))
    .ncol <- .nrow
  matrix(runif(.nrow * .ncol), nrow = .nrow, ncol = .ncol)
}
