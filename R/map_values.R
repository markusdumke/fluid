#' Map values
#'
#' Replace values in a vector by matching values in a lookup vector.
#' This function is similar to [plyr::mapvalues].
#'
#' @param .x Vector to modify.
#' @param .from Vector of values that should be replaced in `.x`.
#' @param .to Vector of new replacement values.
#' @param .verbose Logical scalar.
#'
#' @return A vector.
#' @export
#'
#' @examples
#' .x = c("Plebejus optilete", "Aglais io", "Plebejus optilete")
#' .from = c("Plebejus optilete", "Argynnis aglaja")
#' .to = c("Agriades optilete", "Speyeria aglaja")
#' map_values(.x, .from, .to)
map_values <- function(.x, .from, .to, .verbose = TRUE) {

  stopifnot(length(.from) == length(.to))
  m <- match(.x, .from)
  replaced <- .from[m[!is.na(m)]]
  replacement <- .to[m[!is.na(m)]]

  if (.verbose) {
    summary <- data.table(from = replaced, to = replacement) %>%
      .[, .N, by = .(from, to)] %>%
      setorder(-N)

    message(paste0("Replaced '", summary$from, "' with '", summary$to, "' ", summary$N, " times\n"))
  }

  .x[!is.na(m)] <- .to[m[!is.na(m)]]
  .x
}



# FIXME:
# What about factors?
# Warning if elements of .from are not found in .x?
