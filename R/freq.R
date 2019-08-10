#' Show most/least frequent values.
#'
#' These are convenient functions to show the most frequent or least frequent
#' values in a factor or character vector.
#'
#' @param .x A vector passed on to [table].
#' @param .n Integer scalar. Number of classes to show.
#'
#' @return Table object.
#' @export
#' @importFrom utils head
#' @rdname freq
#'
#' @examples
#' iris[1:79, "Species"] %>% freq()
#' iris[1:79, "Species"] %>% infreq(2)
freq <- function(.x, .n = 10) {
  table(.x) %>% sort(decreasing = TRUE) %>% head(min(length(.x), .n))
}

#' @rdname freq
#' @export
infreq <- function(.x, .n = 10) {
  table(.x) %>% sort(decreasing = FALSE) %>% head(min(length(.x), .n))
}
