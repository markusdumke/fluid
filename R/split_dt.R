#' Split a data.table into groups of similar length
#'
#' @param .Data A data.table.
#' @param .n Integer scalar. Number of groups.
#' @param .size Integer scalar. Number of observations per group.
#'
#' @export
#'
#' @examples
#' library(data.table)
#' x <- split_dt(iris %>% as.data.table, 7)
#' lapply(x, NROW)
#'
#' x <- split_dt(iris %>% as.data.table, .size = 50)
#' lapply(x, NROW)
split_dt <- function(.Data, .n = NULL, .size = NULL) {
  if (is.null(.n))
    .n <- ceiling(NROW(.Data) / .size)

  if (is.null(.size))
    .size <- round(NROW(.Data) / .n)

  sequ <- round(seq(.size, NROW(.Data) - .size,
                    length.out = .n - 1L))
  low <- c(1L, sequ + 1L)
  upr <- c(sequ, NROW(.Data))
  purrr::map2(low, upr, ~.Data[.x:.y])
}
