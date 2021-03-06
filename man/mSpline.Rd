% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mSpline.R
\name{mSpline}
\alias{mSpline}
\title{M-Spline Basis for Polynomial Splines and its Derivatives}
\usage{
mSpline(x, df = NULL, knots = NULL, degree = 3L, intercept = FALSE,
        Boundary.knots = range(x, na.rm = TRUE), derivs = 0L, ...)
}
\arguments{
\item{x}{The predictor variable.  Missing values are allowed and will be
returned as they were.}

\item{df}{Degrees of freedom.  One can specify \code{df} rather than
\code{knots}, then the function chooses "df - degree" (minus one if
there is an intercept) knots at suitable quantiles of \code{x} (which
will ignore missing values).  The default, \code{NULL}, corresponds to
no inner knots, i.e., "degree - intercept".}

\item{knots}{The internal breakpoints that define the spline.  The default
is \code{NULL}, which results in a basis for ordinary polynomial
regression.  Typical values are the mean or median for one knot,
quantiles for more knots.  See also \code{Boundary.knots}.}

\item{degree}{Non-negative integer degree of the piecewise polynomial. The
default value is 3 for cubic splines. Zero degree is allowed for
piecewise constant basis.}

\item{intercept}{If \code{TRUE}, an intercept is included in the basis;
Default is \code{FALSE}.}

\item{Boundary.knots}{Boundary points at which to anchor the M-spline basis.
By default, they are the range of the non-\code{NA} data.  If both
\code{knots} and \code{Boundary.knots} are supplied, the basis
parameters do not depend on \code{x}. Data can extend beyond
\code{Boundary.knots}.}

\item{derivs}{A non-negative integer specifying the order of derivatives of
M-splines. The default value is \code{0L} for M-spline bases.}

\item{...}{Optional arguments for future usage.}
}
\value{
A matrix of dimension \code{length(x)} by
\code{df = degree + length(knots)} (plus one if intercept is included).
Attributes that correspond to the arguments specified are returned
for usage of other functions in this package.
}
\description{
This function generates the monotone regression spline (or simply called
M-spline) basis matrix for a polynomial spline or its derivatives of given
order.
}
\details{
It is an implementation of the close form M-spline basis based on
relationship between M-spline basis and B-spline basis.  In fact, M-spline
basis is a rescaled version of B-spline basis. Internally, it calls function
\code{\link{bSpline}} and generates a basis matrix for representing the
family of piecewise polynomials with the specified interior knots and
degree, evaluated at the values of \code{x}.
}
\examples{
## Example given in the reference paper by Ramsay (1988)
library(splines2)
x <- seq.int(0, 1, 0.01)
knots <- c(0.3, 0.5, 0.6)
msMat <- mSpline(x, knots = knots, degree = 2, intercept = TRUE)

library(graphics)
matplot(x, msMat, type = "l", ylab = "M-spline basis")
abline(v = knots, lty = 2, col = "gray")

## derivatives of M-splines
dmsMat <- mSpline(x, knots = knots, degree = 2,
                  intercept = TRUE, derivs = 1)
## or using the 'deriv' method
dmsMat1 <- deriv(msMat)
stopifnot(all.equal(dmsMat, dmsMat1, check.attributes = FALSE))
}
\references{
Ramsay, J. O. (1988). Monotone regression splines in action.
\emph{Statistical science}, 3(4), 425--441.
}
\seealso{
\code{\link{predict.mSpline}} for evaluation at given (new) values;
\code{\link{deriv.mSpline}} for derivative method;
\code{\link{bSpline}} for B-splines;
\code{\link{iSpline}} for I-splines;
\code{\link{cSpline}} for C-splines.
}
