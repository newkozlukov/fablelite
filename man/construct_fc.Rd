% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forecast.R
\name{construct_fc}
\alias{construct_fc}
\title{Construct a new set of forecasts}
\usage{
construct_fc(point, sd, dist)
}
\arguments{
\item{point}{The transformed point forecasts}

\item{sd}{The standard deviation of the transformed forecasts}

\item{dist}{The forecast distribution (typically produced using \code{new_fcdist})}
}
\description{
Will be deprecated in the future, forecast objects should be produced with
either \code{fable} or \code{as_fable} functions.
}
\details{
Backtransformations are automatically handled, and so no transformations should be specified here.
}
