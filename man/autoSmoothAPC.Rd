% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto.l1tp.smooth.R
\name{autoSmoothAPC}
\alias{autoSmoothAPC}
\title{Smooths demographic data using automatically estimated parameters and optionally
taking into account period and cohort effects}
\usage{
autoSmoothAPC(data, effects = TRUE, cornerLength = 7,
  affdDiagonals = NULL, affdYears = NULL, lower = head(c(0.01, 0.01, 0.01,
  2, 0.001, 2, 0.001), 3 + effects * 4), upper = head(c(1.2, 1.8, 1.2, 12,
  0.4, 12, 0.4), 3 + effects * 4), init = head(c(0.1, 0.1, 0.2, 4, 0.001, 4,
  0.001), 3 + effects * 4), reltol = 0.001, parameters = NULL, trace = F,
  control = list(nnzlmax = 1e+06, nsubmax = 2e+06, tmpmax = 2e+05),
  weights = NULL)
}
\arguments{
\item{data}{Demographic data (log mortality) presented as a matrix.
Row numbers represent ages and column numbers represet time.}

\item{effects}{Controls if the cohort and period effects are taken into account.}

\item{cornerLength}{Sets the smallest length of a diagonal to be considered for cohort effects.}

\item{affdDiagonals}{Diagonals to be used for cohort effects.
The first diagonal is at the bottom left corner of the data matrix (maximal age and minimal time in the data matrix).}

\item{affdYears}{Years to be used for period effects.}

\item{lower}{Lowest possible values for the optimization procedure.}

\item{upper}{Highest possible values for the optimization procedure.}

\item{init}{Initial values for the optimization procedure.}

\item{reltol}{Relative tolerance parameter to be supplied to \code{\link[stats]{optim}} function.}

\item{parameters}{Optional model parameters. If not provided, they are estimated.}

\item{trace}{Controls if tracing is on.}

\item{control}{The control data passed directly to \code{\link[quantreg]{rq.fit.sfn}} function.}

\item{weights}{Define how much every observation effect the resulting smooth surface.
The parameter must have same dimentions as \code{data} parameter.
Weights can be set to reciprocal of estimated standard deviation of the data.}
}
\value{
A list of four components: smooth surface, period effects, cohort effects and parameters
used for smoothing (passed as a parameter or estimated).
}
\description{
If period and cohort effects are taken into account (effects = TRUE) the method uses all
available years and diagonals for estimation of the period and cohort effects.
}
\examples{
\donttest{

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
plot(m)
sm <- autoSmoothAPC(m)
plot(sm)
plot(sm, "period")
plot(sm, "cohort")

}
}
\author{
Alexander Dokumentov
}
\references{
\url{http://robjhyndman.com/publications/mortality-smoothing/}
}
\seealso{
\code{\link{smoothAPC}} and \code{\link{signifAutoSmoothAPC}}. The latter might give slightly better performance.
}

