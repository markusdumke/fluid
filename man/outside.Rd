% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outside.R
\name{\%outside\%}
\alias{\%outside\%}
\alias{\%inside\%}
\title{Inside / Outside}
\usage{
.x \%outside\% .y

.x \%inside\% .y
}
\arguments{
\item{.x}{Vector to test.}

\item{.y}{Vector or list of length 2.
The first element is interpreted as the lower bound,
the second element as the upper limit.}
}
\value{
A logical vector of the same length as \code{.x}.
}
\description{
Inside / Outside
}
\examples{
1 \%outside\% c(2, 5)
1 \%inside\% c(2, 5)
}
