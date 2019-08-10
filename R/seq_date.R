#' Generate sequence of dates
#'
#' This is like [seq.Date], but automatically parses character inputs in from
#' and to arguments making it more convenient to work with.
#'
#' @param .from Character/Date scalar. Starting date.
#' @param .to Character/Date scalar. End date.
#' @param .by Passed on to [seq.Date].
#' @param .length.out Passed on to [seq.Date].
#'
#' @export
#'
#' @examples
#' seq_date("2018-09-01", "2018-09-10")
#' seq_date("2018-09-01", "2018-09-10", .by = 2L)
#' seq_date("2019-01-01", .length.out = 10L)
seq_date <- function(.from, .to, .by, .length.out = NULL) {
  .from <- as.Date(.from)
  if (!missing(.to)) {
    .to <- as.Date(.to)
  }

  if (missing(.by)) {
    .by <- 1L
  }

  seq.Date(from = .from, to = .to, by = .by, length.out = .length.out)
}

#' Create a Date or Datetime vector
#'
#' Equivalent to `character()`, `numeric()`, `integer()` etc.
#'
#' @param .length Integer scalar. Length of vector.
#' @rdname Date
#' @export
#'
#' @examples
#' Date()
#' Date(5)
Date <- function(.length = 0L) {
  x <- integer(.length)
  class(x) <- "Date"
  x
}

#' @rdname Date
#' @export
Datetime <- function(.length = 0L) {
  x <- integer(.length)
  class(x) <- "POSIXct"
  x
}
