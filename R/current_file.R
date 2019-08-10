#' Path to currently open document in RStudio
#'
#' @return Character scalar with the path.
#' @export
#'
#' @rdname current_file
#'
#' @examples
#' if (interactive()) {
#'   current_file()
#' }
current_file <- function() {
  rstudioapi::getSourceEditorContext()$path
}

#' @rdname current_file
#' @export
current_dir <- function() {
  dirname(rstudioapi::getSourceEditorContext()$path)
}

#' @rdname current_file
#' @export
setwd_current <- function() {
  setwd(current_dir())
}
