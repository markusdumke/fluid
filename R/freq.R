#' Show most/least frequent values.
#'
#' These are convenient functions to show the most frequent or least frequent
#' values in a factor or character vector.
#'
#' @param .x A vector passed on to [table].
#' @param .n Integer scalar. Number of classes to show.
#' @param .prop Logical value. Show proportions?
#'
#' @return Table object.
#' @export
#' @importFrom utils head
#' @rdname freq
#'
#' @examples
#' iris[1:79, "Species"] %>% freq()
#' iris[1:79, "Species"] %>% infreq(2)
freq <- function(.x, .n = 10, .prop = FALSE) {
  x <-
    table(.x) %>%
    sort(decreasing = TRUE) %>%
    head(min(length(.x), .n))

  if (isTRUE(.prop)) {
    x <- x / length(.x)
  }

  x
}

#' @rdname freq
#' @export
infreq <- function(.x, .n = 10, .prop = FALSE) {
  x <-
    table(.x) %>%
    sort(decreasing = FALSE) %>%
    head(min(length(.x), .n))

  if (isTRUE(.prop)) {
    x <- x / length(.x)
  }

  x
}

#' Frequency table
#'
#' Show frequencies of categories in a data.table.
#'
#' @param .x A vector of values, typical factor/character.
#' @param .lump Lump together small categories to "Other"?
#' @param .cum Logical value. Show cumulative sums?
#' @param .decreasing Logical value. Sort descending?
#' @param .digits Integer value. Number of digits to round proportions to.
#' @param ... Arguments passed on to [forcats::fct_lump()].
#'
#' @return A data.table containing absolute and relative frequencies.
#' @export
#'
#' @examples
#' iris$Species %>% freq_table()
#'
#' if (require(nycflights13)) {
#'   nycflights13::flights$carrier %>% freq_table()
#' }
freq_table <- function(.x, .lump = TRUE, .cum = FALSE, .decreasing = TRUE, .digits = 3, ...) {
  if (isTRUE(.lump)) {
    n.levels.before <- uniqueN(.x)
    .x <- forcats::fct_lump(.x, ...)
    n.lumped <-  n.levels.before - uniqueN(.x)
    if (n.lumped > 0) {
      message("Lumped together ", n.lumped + 1L, " categories to Other.")
    }
  }

  x <-
    table(.x, useNA = "always") %>%
    sort(decreasing = .decreasing) %>%
    data.table() %>%
    .[, Prop := round(N / sum(N, na.rm = TRUE), .digits)]

  if (isTRUE(.cum)) {
    x <-
      x %>%
      .[, Cum.N := cumsum(N)] %>%
      .[, Cum.Prop := cumsum(Prop)]
  }

  x[]
}

globalVariables(c("Prop", "Cum.N", "Cum.Prop", "n_NA"))
