#' myncurve
#'
#' @param a value
#' @param mu mean
#' @param sigma standard deviation
#'
#' @return list
#' @export
#'
#' @importFrom graphics hist
#' @importFrom stats rpois
#' @importFrom stats dpois
#' @importFrom stats dnorm
#' @importFrom graphics layout
#' @importFrom graphics curve
#' @importFrom graphics polygon
#' @importFrom graphics text
#' @importFrom stats pnorm
#'
#' @examples
#' myncurve(5, 5, 2)
myncurve = function(a, mu, sigma){
  x = c(1,100)
  curve(dnorm(x,mean=mu,sd=sigma), xlim = c(mu-3*sigma, mu + 3*sigma))
  xcurve = seq(-100, a, length=1000)
  ycurve=dnorm(xcurve, mean = mu, sd = sigma)
  polygon(c(-100, xcurve, a), c(0, ycurve, 0), col="Red")
  prob=round(pnorm(a,mean=mu,sd=sigma), 4)
  text(x=a, y = .07, paste("Area = ", prob, sep=""))
  list(area = prob, mu = mu, sigma = sigma)
}


