% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto.l1tp.smooth.R
\name{signifAutoSmoothAPC}
\alias{signifAutoSmoothAPC}
\title{Smooths demographic data using automatically estimated parameters and
taking into account only significant period and cohort effects}
\usage{
signifAutoSmoothAPC(data, p.value = 0.05, cornerLength = 7,
  lower = c(0.01, 0.01, 0.01, 1, 0.001, 1, 0.001), upper = c(1.2, 1.8, 1.2,
  12, 0.4, 12, 0.4), init = c(0.1, 0.1, 0.2, 4, 0.001, 4, 0.001),
  reltol = 0.001, trace = F, control = list(nnzlmax = 1e+06, nsubmax =
  2e+06, tmpmax = 2e+05), weights = NULL)
}
\arguments{
\item{data}{Demographic data (log mortality) presented as a matrix.
Row numbers represent ages and column numbers represet time.}

\item{p.value}{P-value used to test the period and the cohort effects for significance.
The lower the value the fewer diagonals and years will be used to find cohort and period effects.}

\item{cornerLength}{Minimal length of a diagonal to be considered for cohort effects.}

\item{lower}{Lowest possible values for the optimization procedure.}

\item{upper}{Highest possible values for the optimization procedure.}

\item{init}{Initial values for the optimization procedure.}

\item{reltol}{Relative tolerance parameter to be supplied to \code{\link[stats]{optim}} function.}

\item{trace}{Controls if tracing is on.}

\item{control}{The control data passed directly to \code{\link[quantreg]{rq.fit.sfn}} function.}

\item{weights}{Define how much every observation effect the resulting smooth surface.
The parameter must have same dimentions as \code{data} parameter.
Weights can be set to reciprocal of estimated standard deviation of the data.}
}
\value{
A list of six components: smooth surface, period effects, cohort effects, parameters
used for smoothing, diagonals used for cohort effects and years used for period effects.
}
\description{
It is a heuristic procedure which tries to figure out positions of
period and cohort effects in the data. It also uses a few steps to estimate
model's parameters. The procedure is supposed to outperform \code{\link{autoSmoothAPC}} slightly.
}
\examples{
\donttest{

library(demography)
m <- log(fr.mort$rate$female[1:30, 120:139])
plot(m)
sm <- signifAutoSmoothAPC(m)
plot(sm)
plot(sm, "surface")
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
\code{\link{autoSmoothAPC}}, \code{\link{smoothAPC}}.
}

