% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate.R
\name{imitate}
\alias{imitate}
\alias{imitate.mdl_df}
\alias{imitate.model}
\title{Imitate responses from a model}
\usage{
imitate(object, ...)

\method{imitate}{mdl_df}(object, new_data = NULL, ...)

\method{imitate}{model}(object, new_data = NULL, h = NULL, times = 1,
  seed = NULL, ...)
}
\arguments{
\item{object}{A model}

\item{...}{Additional optional arguments}

\item{new_data}{The data to be imitated (time index and exogenous regressors)}

\item{h}{The simulation horizon (can be used instead of \code{new_data} for regular
time series with no exogenous regressors).}

\item{times}{The number of replications}

\item{seed}{The seed for the random generation from distributions}
}
\description{
Use a model's fitted distribution to simulate additional data with similar
behaviour to the response. This is a tidy implementation of
\code{\link[stats]{simulate}}.
}
\examples{
library(fable)
UKLungDeaths <- as_tsibble(cbind(mdeaths, fdeaths), gather = FALSE)
UKLungDeaths \%>\% 
  model(lm = TSLM(mdeaths ~ fourier("year", K = 4) + fdeaths)) \%>\% 
  imitate(UKLungDeaths, times = 5)

}
