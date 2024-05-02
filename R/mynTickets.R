#' ntickets
#'
#' @param N
#' Number of seats on plane
#' @param gamma
#' probability of overbooking
#' @param p
#' probability of selling out
#'
#' @return
#' number of seats sold that could overflow
#' @export
#'
#' @importFrom graphics abline
#' @importFrom stats pbinom
#' @importFrom stats optimize
#' @importFrom stats dnorm
#' @importFrom graphics layout
#' @importFrom graphics curve
#'
#' @examples
#' ntickets(N = 200, gamma = .02, p = .95)
ntickets <- function(N, gamma, p) {
  n <- seq(N, floor(N + (.1 * N)), by = 1)
  discrete <- 1 - gamma - pbinom(q = N, size = n, prob = p)

  continuous_function <- function(n) {
    1 - gamma - pnorm(N + .5, n * p, sqrt(n * p * (1 - p)))
  }
  continuous <- 1 - gamma - pnorm(N + .5, n * p, sqrt(n * p * (1 - p)))

  n_discrete <- n[which.min(abs(discrete))]
  x = 1
  n_continuous <- optimize(
    f = function(x) abs(continuous_function(x)),
    interval = c(N, floor(N * 1.2))
  )$minimum


  curve(continuous_function(x),
        N,
        floor(N * 1.1),
        ylab = "Objective",
        xlab = "n",
        main = sprintf("Objective Vs n to find optimal tickets sold\n(%f) gamma = %f N = %d continuous",
                       n_continuous, gamma, N),
        col = "blue")
  abline(v = n_continuous, h = 0, lwd = 2, col = "red")

  plot(n,
       discrete,
       ylab = "Objective",
       xlab = "n",
       main = sprintf("Objective Vs n to find optimal tickets sold\n(%d) gamma = %f N = %d discrete",
                      n_discrete, gamma, N),
       pch = 23,
       cex = 1,
       bg = "blue")
  abline(v = n_discrete, h = 0, lwd = 2, col = "red")

  output = list(nd = n_discrete, nc = n_continuous, N = N, p = p, gamma = gamma)
  print(output)
}
