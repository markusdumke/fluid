% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/empty_string_to_na.r
\name{empty_string_to_na}
\alias{empty_string_to_na}
\title{Convert empty string and "NA" to NA}
\usage{
empty_string_to_na(.x)
}
\arguments{
\item{.x}{Character vector.}
}
\value{
Vector of same length as \code{.x}.
}
\description{
Convert empty string and "NA" to NA
}
\examples{
empty_string_to_na(c("a", "", "NA", "b"))
}
