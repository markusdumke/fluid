#' #' Convert data.table or data.frame to vector
#' #'
#' #' @param .Data A data.frame or data.table.
#' #'
#' #' @return An unnamed vector.
#' #' @export
#' #'
#' #' @rdname data_table_to_vector
#' #'
#' #' @examples
#' #' library(data.table)
#' #' data_table_to_vector(data.table(a = 1, b = 2))
#' data_frame_to_vector <- function(.Data) {
#'   .Data %>% unlist %>% unname
#' }
#'
#' #' @export
#' #' @rdname data_table_to_vector
#' data_table_to_vector <- data_frame_to_vector
#'
#'
#' # TODO: Achtung konvertiert Variablen (factor to numeric)
#' # data_frame_to_vector(iris[1, ])
