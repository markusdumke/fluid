style <- function(...) crayon::bold(crayon::silver(...))

cat_line <- function(...) {
  cat(paste0(..., "\n"), sep = "")
}

#' Summarize data.frame
#'
#' @param .Data A data.frame or data.table.
#'
#' @export
#'
#' @examples
#' .Data <- data.table(a = letters[1:3],
#'                     b = 1:12,
#'                     c = runif(12),
#'                     d = c(NA, 1:11),
#'                     e = seq_date("2019-01-01", .length.out = 12))
#' summarize(.Data)
#'
#' summarize(iris)
#' if (require(nycflights13)) {
#'   nycflights13::flights %>% summarize()
#' }
summarize <- function(.Data) {

  data.class <- `if`("data.table" %in% class(.Data), "data.table", "data.frame")
  cat_line(data.class %s% ": " %s% NROW(.Data) %s%  " x " %s% NCOL(.Data))

  .Data <- as.data.table(.Data)
  col.types <- purrr::map_chr(.Data, ~class(.x)[1])
  x <- table(col.types) %>%
    as.list() %>%
    purrr::imap(., ~ stringr::str_pad(.x, nchar(.y)), side = "left")

  cat_line()

  cat_line(style("Column types:"))
  cat_line(str_collapse(names(x), " "))
  cat_line(str_collapse(unname(x), " "))


  Numerics <- purrr::keep(.Data, function(x) is.numeric(x))

  if (NROW(Numerics) > 0) {
    cat_line()
    cat_line(style("Numeric columns:"))

    Numerics %>%
      purrr::map(function(x) {
        t <- typeof(x)
        res <-
          summary(x) %>%
          round(3) %>%
          as.list() %>%
          data.frame()
        if ("NA.s" %notin% names(res)) {
          res[["NA.s"]] <- 0L
        }
        res$type <- t
        res
      }) %>%
      rbindlist(idcol = "column", use.names = TRUE, fill = TRUE) %>%
      setnames(c("Min.", "X1st.Qu.", "Median", "Mean", "X3rd.Qu.", "Max.", "NA.s"),
               c("min", "q_0.25", "median", "mean", "q_0.75", "max", "n_NA"),
               skip_absent = TRUE) %>%
      setcolorder(c("column", "type")) %>%
      print()
  }


  Dates <- purrr::keep(.Data, ~ "Date" %in% class(.x))
  if (NROW(Dates) > 0) {
    cat_line()
    cat_line(style("Date columns:"))

    Dates %>%
      purrr::map(function(x) {
        res <-
          summary(x) %>%
          as.character() %>%
          as.list() %>%
          data.frame()
        if ("NA.s" %notin% names(res)) {
          res[["NA.s"]] <- 0L
        }
        res
      }) %>%
      rbindlist(idcol = "column", use.names = TRUE, fill = TRUE) %>%
      setnames(c("Min.", "X1st.Qu.", "Median", "Mean", "X3rd.Qu.", "Max.", "NA.s"),
               c("min", "q_0.25", "median", "mean", "q_0.75", "max", "n_NA"),
               skip_absent = TRUE) %>%
      .[, .(min, max, n_NA)] %>%
      print()
  }

  max.categories <- max(100, .Data[, .N] / 100)

  Characters <- purrr::keep(.Data, ~ is.character(.x) & uniqueN(.x) >= max.categories)
  if (NROW(Characters) > 0) {
    cat_line()
    cat_line(style("Text columns:"))
    for (i in seq_col(Characters)) {
      cat_line("$ ", names(Characters)[i], ": ",
               str_collapse(Characters[[i]][seq_len(min(3, NROW(Characters)))], ","),
               ", ...")
    }

  }

  Factors <- purrr::keep(.Data, ~ is.factor(.x) | (is.character(.x) & uniqueN(.x) < max.categories))
  if (NROW(Factors) > 0) {
    cat_line()
    cat_line(style("Categorical columns:"))

    for (i in seq_col(Factors)) {
      cat_line("$ ", names(Factors)[i])
      Factors[[i]] %>% freq_table() %>% setnames(".x", "value") %>% print()
      cat_line()
    }
  }
  invisible(.Data)
}

# should work for vectors and data.frames, data.tables
# nrow, ncol
# nmissings per col
# number of columns per type
# for factors most frequent categories and least frequent categories
# strings with less than 100 different entries treated as factors?
# numeric columns show min, mean, max
# number of distinct values
# number of categories
# unique columns


# summarize(nycflights13::flights)
