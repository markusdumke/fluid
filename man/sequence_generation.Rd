% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seq_row.R
\name{seq_row}
\alias{seq_row}
\alias{seq_col}
\title{Sequence along rows or columns}
\usage{
seq_row(.Data)

seq_col(.Data)
}
\arguments{
\item{.Data}{(data.frame or data.table)}
}
\value{
Vector with length of \code{NROW(.Data)} or \code{NCOL(.Data)}.
}
\description{
Sequence along rows or columns
}
\examples{
seq_row(iris)
seq_col(iris)
}
\seealso{
\link[base:seq]{base::seq}
}
