#' Generate sequence of dates
#'
#' This is like [seq.Date], but automatically parses character inputs in from
#' and to arguments making it more convenient to work with.
#'
#' @param from Character/Date scalar. Starting date.
#' @param to Character/Date scalar. End date.
#' @param by Passed on to [seq.Date].
#'
#' @export
#'
#' @examples
#' seq_date("2018-09-01", "2018-09-10", by = 1L)
seq_date <- function(from, to, by = 1L) {
  from <- as.Date(from)
  to <- as.Date(to)
  seq.Date(from = from, to = to, by = by)
}

#' Create a Date or Datetime vector
#'
#' Equivalent to `character()`, `numeric()`, `integer()` etc.
#'
#' @rdname Date
#' @export
#'
#' @examples
#' Date()
#' Date(5)
Date <- function(length = 0L) {
  x <- integer(length)
  class(x) <- "Date"
  x
}

#' @rdname Date
#' @export
Datetime <- function(length = 0L) {
  x <- integer(length)
  class(x) <- "POSIXct"
  x
}
